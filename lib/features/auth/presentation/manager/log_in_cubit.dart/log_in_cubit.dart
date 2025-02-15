import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._authRepo) : super(LogInInitial());
  final AuthRepo _authRepo;

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    emit(LogInLoading());

    var logInResult = await _authRepo.logIn(email: email, password: password);

    logInResult.fold(
      (failure) {
        if (failure.errMsg == "is not verify!") {
          emit(LogInNeedVerification(email: email));
        } else {
          emit(LogInFailure(errorMessage: failure.errMsg));
        }
      },
      (logInSuccessModel) async {
        await getIt<SecureStorageHelper>()
            .setData(key: ApiKeys.token, value: logInSuccessModel.token);
        emit(LogInSuccess());
      },
    );
  }

  Future<void> logInWithGoogle() async {
    emit(LogInLoading());

    var logInResult = await _authRepo.logInWithGoogle();

    logInResult.fold(
      (failure) {
        emit(LogInFailure(errorMessage: failure.errMsg));
      },
      (nullableLogInSuccessModel) async {
        if (nullableLogInSuccessModel != null) {
          await getIt<SecureStorageHelper>().setData(
              key: ApiKeys.token, value: nullableLogInSuccessModel.token);
          emit(LogInSuccess());
        } else {
          emit(LogInInitial());
        }
      },
    );
  }
}
