import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._authRepo) : super(ResetPasswordInitial());
  final AuthRepo _authRepo;
  String email = '';
  void initEmail({required String email}) {
    this.email = email;
  }

  Future<void> resetPassword({required String password}) async {
    emit(ResetPasswordLoading());

    var result =
        await _authRepo.resetPassword(email: this.email, newPassword: password);

    result.fold(
      (failure) => emit(ResetPasswordFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey)),
      (signUpSuccess) => emit(ResetPasswordSuccess()),
    );
  }
}
