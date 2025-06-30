import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:dartz/dartz.dart';

abstract class OtpRepo{
  Future<Either<ApiFailure, void>> sendVerificationCode({
    required OtpReason otpReason,
  });

  Future<Either<ApiFailure, void>> verifyVerificationCode({
    required OtpReason otpReason,
    required int verificationCode,
  });
}