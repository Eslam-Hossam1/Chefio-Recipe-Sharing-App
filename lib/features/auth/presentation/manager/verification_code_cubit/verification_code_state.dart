part of 'verification_code_cubit.dart';

sealed class VerificationCodeState extends Equatable {
  const VerificationCodeState();

  @override
  List<Object> get props => [];
}

final class VerificationCodeInitial extends VerificationCodeState {}

final class SendVerificationCodeSuccess extends VerificationCodeState {}

final class VerifyVerificationCodeSuccess extends VerificationCodeState {}
final class ShowSendAgain extends VerificationCodeState {}

final class SendVerificationCodeFailure extends VerificationCodeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const SendVerificationCodeFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class VerifyVerificationCodeFailure extends VerificationCodeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const VerifyVerificationCodeFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class VerificationCodeLoading extends VerificationCodeState {}
