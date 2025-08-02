import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SignUpReason implements OtpReason {
  final ApiConsumer _apiConsumer;
  @override
  final String email;

  SignUpReason({
    required ApiConsumer apiConsumer,
    required this.email,
  }) : _apiConsumer = apiConsumer;

  @override
  onSuccess(BuildContext context) {
    DialogHelper.showSuccessDialog(
      context,
      successMessage:
          AppLocalizationKeys.auth.verificationCodeViewSuccessMessage.tr(),
      btnOkOnPress: () {
        context.go(RoutePaths.login);
      },
      onDismissCallback: (_) {
        context.go(RoutePaths.login);
      },
    );
  }

  @override
  bool sendCodeOnOpen = true;

  @override
  Future sendCodeRequest() async {
    await _apiConsumer.patch(
      EndPoints.sendVerificationCode,
      data: {
        ApiKeys.email: email,
      },
    );
  }

  @override
  Future verifyCodeRequest({required int verificationCode}) async {
    await _apiConsumer.patch(
      EndPoints.verifyVerificationCode,
      data: {
        ApiKeys.email: email,
        ApiKeys.providedCode: verificationCode,
      },
    );
  }

  @override
  String localizationExitWarningConfirmation =
      AppLocalizationKeys.auth.signUpExitWarning;
}
