import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_verification_code_state.dart';

class ForgotPasswordVerificationCodeCubit
    extends Cubit<ForgotPasswordVerificationCodeState> {
  ForgotPasswordVerificationCodeCubit(this._authRepo)
      : super(ForgotPasswordVerificationCodeInitial());
  final AuthRepo _authRepo;
  String email = "";

  void initEmailAndStartTimer({required String email}) {
    this.email = email;
    emit(SendForgotPasswordVerificationCodeSuccess());
  }

  Future<void> resendForgotPasswordVerificationCode() async {
    emit(ForgotPasswordVerificationCodeLoading());
    var verificationCodeResult =
        await _authRepo.sendForgotPasswordVerificationCode(email: email);

    verificationCodeResult.fold(
      (failure) => emit(SendForgotPasswordVerificationCodeFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey)),
      (_) => emit(SendForgotPasswordVerificationCodeSuccess()),
    );
  }

  void showSendAgain() => emit(ShowSendAgain());

  Future<void> verfiyForgotPasswordVerificationCode({required int code}) async {
    emit(ForgotPasswordVerificationCodeLoading());
    var verificationCodeResult = await _authRepo
        .verifyForgotPasswordVerificationCode(email: email, code: code);

    verificationCodeResult.fold(
      (failure) => emit(VerifyForgotPasswordVerificationCodeFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey)),
      (_) => emit(VerifyForgotPasswordVerificationCodeSuccess()),
    );
  }
}
