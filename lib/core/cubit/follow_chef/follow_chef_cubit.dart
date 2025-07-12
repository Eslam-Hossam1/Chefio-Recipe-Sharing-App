import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/services/follow_chef_service.dart';
import 'package:equatable/equatable.dart';

part 'follow_chef_state.dart';

class FollowChefCubit extends Cubit<FollowChefState> {
  final FollowChefService _followChefService;

  FollowChefCubit({required FollowChefService followChefService})
      : _followChefService = followChefService,
        super(
          FollowChefInitial(),
        );

  Future<void> toggleFollowChef({
    required String chefId,
    required bool isFollowing,
  }) async {
    emit(FollowChefLoading(chefId: chefId));
    var result = await _followChefService.toggleFollowChef(chefId: chefId);
    result.fold(
      (failure) {
        emit(
          FollowChefFaiure(
            chefId: chefId,
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey,
          ),
        );
      },
      (success) {
        int myProfileFollowingChange;
        myProfileFollowingChange = isFollowing ? -1 : 1;
        emit(
          FollowChefSuccess(
            chefId: chefId,
            myProfileFollowingChange: myProfileFollowingChange,
          ),
        );
      },
    );
  }
}
