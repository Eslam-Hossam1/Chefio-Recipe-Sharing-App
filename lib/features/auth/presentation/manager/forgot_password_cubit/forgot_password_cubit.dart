import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/errors/error_codes.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authRepo) : super(ForgotPasswordInitial());
  final AuthRepo _authRepo;

  Future<void> sendVerficationCode({
    required String email,
  }) async {
    emit(ForgotPasswordLoading());

    var result = await _authRepo.sendForgotPasswordVerificationCode(
      email: email,
    );

    result.fold(
      (failure) {
        if(failure.errCode==ErrorCodes.notFound){
          emit(ForgotPasswordFailure(
            errorMessage: failure.errMsg,
            errorLocalizaitonKey: failure.localizaitonKey));
        }
        emit(ForgotPasswordFailure(
            errorMessage: failure.errMsg,
            errorLocalizaitonKey: failure.localizaitonKey));
      },
      (_) async {
        emit(ForgotPasswordSuccess(email: email));
      },
    );
  }
}
