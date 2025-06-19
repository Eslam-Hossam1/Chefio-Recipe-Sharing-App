import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/features/auth/data/models/log_in_success_model.dart';
import 'package:chefio_app/features/auth/data/models/sign_up_success_model/sign_up_success_model.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepo {
  Future<Either<ApiFailure, SignUpSuccessModel>> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<ApiFailure, LogInSuccessModel>> logIn({
    required String email,
    required String password,
  });

  Future<Either<ApiFailure, void>> sendVerificationCode(
      {required String email});

  Future<Either<ApiFailure, void>> verifyVerificationCode({
    required String email,
    required int code,
  });

  Future<Either<ApiFailure, void>> verifyForgotPasswordVerificationCode({
    required String email,
    required int code,
  });
  Future<Either<ApiFailure, void>> sendForgotPasswordVerificationCode({
    required String email,
  });
  Future<Either<ApiFailure, void>> resetPassword({
    required String email,
    required String newPassword,
  });

  Future<Either<ApiFailure, LogInSuccessModel?>> logInWithGoogle();
  Future<Either<ApiFailure, void>> sendFcmToken();
  Future<Either<ApiFailure, void>> logout();
}
