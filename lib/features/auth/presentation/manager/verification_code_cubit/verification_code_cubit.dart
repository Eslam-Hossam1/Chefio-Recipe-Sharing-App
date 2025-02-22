import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit(this._authRepo) : super(VerificationCodeInitial());
  final AuthRepo _authRepo;
  String email = "";
  Future<void> sendVerificationCode({required String email}) async {
    emit(VerificationCodeLoading());
    this.email = email;
    var verificationCodeResult =
        await _authRepo.sendVerificationCode(email: email);

    verificationCodeResult.fold(
      (failure) => emit(SendVerificationCodeFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey)),
      (_) => emit(SendVerificationCodeSuccess()),
    );
  }

  void showSendAgain() => emit(ShowSendAgain());

  Future<void> resendVerificationCode() async {
    emit(VerificationCodeLoading());
    var verificationCodeResult =
        await _authRepo.sendVerificationCode(email: email);

    verificationCodeResult.fold(
      (failure) => emit(SendVerificationCodeFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey)),
      (_) => emit(SendVerificationCodeSuccess()),
    );
  }

  Future<void> verfiyVerificationCode({required int code}) async {
    emit(VerificationCodeLoading());
    var verificationCodeResult =
        await _authRepo.verifyVerificationCode(email: email, code: code);

    verificationCodeResult.fold(
      (failure) => emit(VerifyVerificationCodeFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey)),
      (_) => emit(VerifyVerificationCodeSuccess()),
    );
  }
}
