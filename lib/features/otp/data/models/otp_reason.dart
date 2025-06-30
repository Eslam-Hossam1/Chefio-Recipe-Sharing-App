import 'package:flutter/widgets.dart';

abstract class OtpReason {
  final bool sendCodeOnOpen;
  final String localizationExitWarningConfirmation;
  Future sendCodeRequest();
  Future verifyCodeRequest({
    required int verificationCode,
  });
  final String email;
  onSuccess(BuildContext context);

  OtpReason(
      {required this.sendCodeOnOpen,
      required this.localizationExitWarningConfirmation,
      required this.email,});
}
