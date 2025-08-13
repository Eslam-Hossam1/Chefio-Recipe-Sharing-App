part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String email;

  SignUpSuccess({required this.email});
}

final class SignUpLoading extends SignUpState {}

final class SignUpEmailRegisteredButNotVerified extends SignUpState {
  final String email;

  SignUpEmailRegisteredButNotVerified({required this.email});
}

final class SignUpFailure extends SignUpState {
  final String errorMessage;
  final String errorLocalizationKey;

  SignUpFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}
