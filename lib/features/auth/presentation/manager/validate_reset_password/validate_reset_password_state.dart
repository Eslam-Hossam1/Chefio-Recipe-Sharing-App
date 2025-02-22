part of 'validate_reset_password_cubit.dart';

sealed class ValidateResetPasswordState extends Equatable {
  const ValidateResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ValidateResetPasswordInitial extends ValidateResetPasswordState {}

final class ValidateResetPasswordUpdate extends ValidateResetPasswordState {}
