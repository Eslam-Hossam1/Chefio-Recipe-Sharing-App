part of 'verification_code_cubit.dart';

sealed class VerificationCodeState extends Equatable {
  const VerificationCodeState();

  @override
  List<Object> get props => [];
}

final class VerificationCodeInitial extends VerificationCodeState {}

final class SendVerificationCodeSuccess extends VerificationCodeState {}

final class VerifyVerificationCodeSuccess extends VerificationCodeState {}

final class VerificationCodeFailure extends VerificationCodeState {
  final String errorMessage;

  const VerificationCodeFailure({required this.errorMessage});
}

final class VerificationCodeLoading extends VerificationCodeState {}
