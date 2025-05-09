import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:equatable/equatable.dart';

part 'profile_follow_button_state.dart';

class ProfileFollowButtonCubit extends Cubit<ProfileFollowButtonState> {
  final AuthCredentialsHelper _authCredentialsHelper;
  ProfileFollowButtonCubit({required AuthCredentialsHelper authCreadentialsHelper})
      : _authCredentialsHelper = authCreadentialsHelper,
        super(MyProfile());
  void checkIsMyProfile({required String chefId}) {
    var loggedChefId = _authCredentialsHelper.userId;
    if (loggedChefId == chefId) {
      emit(MyProfile());
    } else {
      emit(NotMyProfile());
    }
  }
}
