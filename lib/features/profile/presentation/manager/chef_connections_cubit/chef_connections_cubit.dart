import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/data/models/chef_follower_model.dart';
import 'package:chefio_app/features/profile/data/models/chef_following_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'chef_connections_state.dart';

class ChefConnectionsCubit extends Cubit<ChefConnectionsState> {
  final ProfileRepo _profileRepo;
  ChefConnectionsCubit({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo,
        super(ChefConnectionsInitial());
  Future<void> fetchChefFollowers({required String chefId}) async {
    var result = await _profileRepo.fetchChefFollowers(chefId: chefId);
    result.fold(
      (failure) => emit(
        ChefConnectionsFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      ),
      (followerModelsList) {
        emit(
          ChefFollowersSuccess(
            followerModelsList: followerModelsList,
          ),
        );
      },
    );
  }

  Future<void> fetchChefFollowing({required String chefId}) async {
    var result = await _profileRepo.fetchChefFollowings(chefId: chefId);
    result.fold(
      (failure) => emit(
        ChefConnectionsFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      ),
      (followingModelsList) {
        emit(
          ChefFollowingSuccess(
            followingModelsList: followingModelsList,
          ),
        );
      },
    );
  }
}
