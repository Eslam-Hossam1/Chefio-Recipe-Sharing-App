import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/services/follow_chef_service.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:equatable/equatable.dart';

part 'follow_chef_in_my_profile_state.dart';

class FollowChefInMyProfileCubit extends Cubit<FollowChefInMyProfileState> {
    final FollowChefService _followChefService;
  FollowChefInMyProfileCubit({required FollowChefService followChefService})
      : _followChefService = followChefService,
        super(
          FollowChefInMyProfileInitial(),
        );

  Future<void> toggleFollowChefInMyProfile({
    required ChefConnectionEntity chefConnection,
  }) async {
    emit(FollowChefInMyProfileProcessing(chefFollowing: chefConnection,));
    var result = await _followChefService.toggleFollowChef(chefId: chefConnection.chefId);
    result.fold(
      (failure) {
        emit(
          FollowChefInMyProfileFailure(chefFollowing: chefConnection,errLocalization: failure.localizaitonKey,)
        );
      },
      (success) {
        emit(
          FollowChefInMyProfileSuccess(),
        );
      },
    );
  }
}
