import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'chef_connections_state.dart';

class ChefConnectionsCubit extends Cubit<ChefConnectionsState> {
  final ProfileRepo _profileRepo;
  List<ChefConnectionEntity> chefConnections = [];
  ChefConnectionsCubit({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo,
        super(ChefConnectionsInitial());
  Future<void> fetchChefFollowers({required String chefId}) async {
    chefConnections.clear();
    emit(ChefConnectionsLoading());
    var result = await _profileRepo.fetchChefFollowers(chefId: chefId);
    result.fold(
      (failure) => emit(
        ChefConnectionsFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      ),
      (followers) {
        if (followers.isEmpty) {
          emit(ChefHasNoFollowers());
          return;
        }
        chefConnections = followers;
        emit(
          ChefConnectionsSuccess(),
        );
      },
    );
  }

  Future<void> fetchChefFollowing({required String chefId}) async {
    chefConnections.clear();
    emit(ChefConnectionsLoading());
    var result = await _profileRepo.fetchChefFollowings(chefId: chefId);
    result.fold(
      (failure) => emit(
        ChefConnectionsFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      ),
      (followings) {
        if (followings.isEmpty) {
          emit(ChefHasNoFollowings());
          return;
        }
        chefConnections = followings;
        emit(
          ChefConnectionsSuccess(),
        );
      },
    );
  }
}
