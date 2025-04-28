import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/errors/error_codes.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/cache/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/auth/data/models/log_in_success_model.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._authRepo, this._authCredentialsHelper)
      : super(LogInInitial());
  final AuthRepo _authRepo;
  final AuthCredentialsHelper _authCredentialsHelper;
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    emit(LogInLoading());

    var logInResult = await _authRepo.logIn(email: email, password: password);

    logInResult.fold(
      (failure) {
        if (failure.errCode == ErrorCodes.forbidden) {
          emit(LogInNeedVerification(email: email));
        } else {
          emit(LogInFailure(
              errorMessage: failure.errMsg,
              errorLocalizationKey: failure.localizaitonKey));
        }
      },
      (logInSuccessModel) async {
        await _authCredentialsHelper.storeTokens(
          accessToken: logInSuccessModel.accessToken,
          refreshToken: logInSuccessModel.refreshToken,
        );
        emit(LogInSuccess());
      },
    );
  }

  Future<void> logInWithGoogle() async {
    emit(LogInLoading());

    var logInResult = await _authRepo.logInWithGoogle();

    logInResult.fold(
      (failure) {
        emit(LogInFailure(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey));
      },
      (nullableLogInSuccessModel) async {
        if (nullableLogInSuccessModel != null) {
          await _authCredentialsHelper.storeTokens(
            accessToken: nullableLogInSuccessModel.accessToken,
            refreshToken: nullableLogInSuccessModel.refreshToken,
          );
          emit(LogInSuccess());
        } else {
          emit(LogInInitial());
        }
      },
    );
  }
}
