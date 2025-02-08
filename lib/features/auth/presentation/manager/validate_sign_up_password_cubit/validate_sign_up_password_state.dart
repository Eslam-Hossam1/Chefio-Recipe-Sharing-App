part of 'validate_sign_up_password_cubit.dart';

@immutable
sealed class ValidateSignUpPasswordState {}

final class ValidateSignUpPasswordInitial extends ValidateSignUpPasswordState {}

final class ValidateSignUpPasswordUpdate extends ValidateSignUpPasswordState {}
