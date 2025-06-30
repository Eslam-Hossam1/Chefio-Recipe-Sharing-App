import 'dart:developer';

import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:chefio_app/features/otp/data/repos/otp_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OtpRepoImpl implements OtpRepo {
  @override
  Future<Either<ApiFailure, void>> sendVerificationCode({
    required OtpReason otpReason,
  }) async {
    try {
      await otpReason.sendCodeRequest();
      return Right(null);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<ApiFailure, void>> verifyVerificationCode(
      {required OtpReason otpReason, required int verificationCode}) async {
    try {
      await otpReason.verifyCodeRequest(verificationCode: verificationCode);
      return Right(null);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  DioApiFailure handleException(Object e) {
    if (e is DioException) {
      return DioApiFailure.fromDioException(
        e,
      );
    } else {
      log(e.toString());
      return DioApiFailure.unknown(
        e.toString(),
      );
    }
  }
}
