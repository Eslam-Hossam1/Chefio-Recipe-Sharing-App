import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/core/utils/google_auth_service.dart';
import 'package:chefio_app/features/auth/data/models/log_in_success_model.dart';
import 'package:chefio_app/features/auth/data/models/sign_up_success_model/sign_up_success_model.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer _apiConsumer;
  final GoogleAuthService _googleAuthService;
  AuthRepoImpl(this._apiConsumer, this._googleAuthService);

  @override
  Future<Either<ApiFailure, SignUpSuccessModel>> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final response = await _apiConsumer.post(
        EndPoints.signUp,
        data: {
          ApiKeys.username: username,
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      final signUpSuccessModel = SignUpSuccessModel.fromJson(response);
      return Right(signUpSuccessModel);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<ApiFailure, void>> sendVerificationCode(
      {required String email}) async {
    try {
      await _apiConsumer.patch(
        EndPoints.sendVerificationCode,
        data: {
          ApiKeys.email: email,
        },
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<ApiFailure, void>> verifyVerificationCode(
      {required String email, required int code}) async {
    try {
      await _apiConsumer.patch(
        EndPoints.verifyVerificationCode,
        data: {ApiKeys.email: email, ApiKeys.providedCode: code},
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<ApiFailure, LogInSuccessModel>> logIn(
      {required String email, required String password}) async {
    try {
      final response = await _apiConsumer.post(
        EndPoints.logIn,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      final logInSuccessModel = LogInSuccessModel.fromJson(response);
      return Right(logInSuccessModel);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<ApiFailure, void>> resetPassword(
      {required String email, required String newPassword}) async {
    try {
      await _apiConsumer.patch(
        EndPoints.resetPassword,
        data: {
          ApiKeys.email: email,
          ApiKeys.newPassword: newPassword,
        },
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<ApiFailure, LogInSuccessModel?>> logInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser =
          await _googleAuthService.signInWithGoogle();
      if (googleUser == null) return right(null);

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final String? idToken = googleAuth.idToken;
      final response = await _apiConsumer.post(
        EndPoints.googleSignIn,
        data: {
          ApiKeys.token: idToken,
        },
      );
      final logInSuccessModel = LogInSuccessModel.fromJson(response);
      return Right(logInSuccessModel);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<ApiFailure, void>> sendForgotPasswordVerificationCode(
      {required String email}) async {
    try {
      await _apiConsumer.post(
        EndPoints.sendForgotPasswordVerificationCode,
        data: {
          ApiKeys.email: email,
        },
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<ApiFailure, void>> verifyForgotPasswordVerificationCode(
      {required String email, required int code}) async {
    try {
      await _apiConsumer.post(
        EndPoints.verifyForgotPasswordVerificationCode,
        data: {ApiKeys.email: email, ApiKeys.providedCode: code},
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(
          e.toString(),
        ));
      }
    }
  }
}
