part of 'validate_password_cubit.dart';

@immutable
sealed class ValidatePasswordState {}

final class ValidatePasswordInitial extends ValidatePasswordState {}

final class ValidatePasswordUpdate extends ValidatePasswordState {}
