import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/features/auth/data/models/sign_up_success_model/sign_up_success_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignUpSuccessModel>> signUp(
      {required String username,
      required String email,
      required String password});

  Future<Either<Failure, void>> sendVerificationCode({required String email});

  Future<Either<Failure, void>> verifyVerificationCode(
      {required String email, required int code});
}
