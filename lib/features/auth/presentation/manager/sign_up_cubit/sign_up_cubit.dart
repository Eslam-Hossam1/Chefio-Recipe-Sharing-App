import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/errors/error_codes.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepo, {this.email = ''}) : super(SignUpInitial());
  final AuthRepo _authRepo;
  String? email;
  Future<void> signUp(
      {required String username,
      required String email,
      required String password}) async {
    emit(SignUpLoading());

    var signUpResult = await _authRepo.signUp(
        username: username, email: email, password: password);

    signUpResult.fold(
      (failure) {
        if (failure.errCode == ErrorCodes.emailNotVerified) {
          emit(SignUpEmailRegisteredButNotVerified(email: email));
        } else {
          emit(
            SignUpFailure(
              errorMessage: failure.errMsg,
              errorLocalizationKey: failure.localizaitonKey,
            ),
          );
        }
      },
      (signUpSuccess) => emit(SignUpSuccess(email: email)),
    );
  }
}
