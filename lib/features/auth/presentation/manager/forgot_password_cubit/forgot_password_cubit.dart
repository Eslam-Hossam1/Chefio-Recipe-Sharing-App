import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authRepo) : super(ForgotPasswordInitial());
    final AuthRepo _authRepo;
  
  Future<void> enterEmailtoRecoverPassword({
    required String email,
  }) async {
    emit(ForgotPasswordLoading());

    var result = await _authRepo.enterEmailToRecoverPassword(email: email,);

    result.fold(
      (failure) {
          emit(ForgotPasswordFailure(errorMessage: failure.errMsg));
      },
      (_) async {
        emit(ForgotPasswordSuccess(email:email));
      },
    );
  }
}
