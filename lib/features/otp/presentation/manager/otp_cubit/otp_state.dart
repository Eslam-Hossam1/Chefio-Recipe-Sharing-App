part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}
final class SendOtpSuccess extends OtpState {}

final class VerifyOtpSuccess extends OtpState {}

final class ShowSendAgain extends OtpState {}

final class SendOtpFailure extends OtpState {
  final String errorMessage;
  final String errorLocalizationKey;

  const SendOtpFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class VerifyOtpFailure extends OtpState {
  final String errorMessage;
  final String errorLocalizationKey;

  const VerifyOtpFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class OtpLoading extends OtpState {}
