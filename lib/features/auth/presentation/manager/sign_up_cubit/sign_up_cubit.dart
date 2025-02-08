import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepo) : super(SignUpInitial());
  final AuthRepo _authRepo;
  Future<void> signUp(
      {required String username,
      required String email,
      required String password}) async {
    emit(SignUpLoading());

    var signUpResult = await _authRepo.signUp(
        username: username, email: email, password: password);

    signUpResult.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.errMsg)),
      (signUpSuccess) => emit(SignUpSuccess()),
    );
  }
}
