part of 'forgot_password_verification_code_cubit.dart';

sealed class ForgotPasswordVerificationCodeState extends Equatable {
  const ForgotPasswordVerificationCodeState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordVerificationCodeInitial
    extends ForgotPasswordVerificationCodeState {}

final class SendForgotPasswordVerificationCodeSuccess
    extends ForgotPasswordVerificationCodeState {}

final class VerifyForgotPasswordVerificationCodeSuccess
    extends ForgotPasswordVerificationCodeState {}

final class ShowSendAgain extends ForgotPasswordVerificationCodeState {}

final class SendForgotPasswordVerificationCodeFailure
    extends ForgotPasswordVerificationCodeState {
  final String errorMessage;
  final String errorLocalizationKey;
  const SendForgotPasswordVerificationCodeFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class VerifyForgotPasswordVerificationCodeFailure
    extends ForgotPasswordVerificationCodeState {
  final String errorMessage;
  final String errorLocalizationKey;
  const VerifyForgotPasswordVerificationCodeFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class ForgotPasswordVerificationCodeLoading
    extends ForgotPasswordVerificationCodeState {}
