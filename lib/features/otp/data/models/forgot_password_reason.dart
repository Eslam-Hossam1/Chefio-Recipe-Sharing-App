import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordReason implements OtpReason {
  final ApiConsumer _apiConsumer;
  @override
  final String email;

  ForgotPasswordReason({
    required ApiConsumer apiConsumer,
    required this.email,
  }) : _apiConsumer = apiConsumer;

  @override
  onSuccess(BuildContext context) {
    context.go(
      RoutePaths.resetPassword,
      extra: email,
    );
  }

  @override
  bool sendCodeOnOpen = false;

  @override
  Future sendCodeRequest() async {
    await _apiConsumer.post(
      EndPoints.sendForgotPasswordVerificationCode,
      data: {
        ApiKeys.email: email,
      },
    );
  }

  @override
  Future verifyCodeRequest({required int verificationCode}) async {
    await _apiConsumer.post(
      EndPoints.verifyForgotPasswordVerificationCode,
      data: {
        ApiKeys.email: email,
        ApiKeys.providedCode: verificationCode,
      },
    );
  }

  @override
  String localizationExitWarningConfirmation =
      AppLocalizationKeys.auth.forgotPasswordExitWarning;
}
