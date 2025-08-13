part of 'log_in_cubit.dart';

sealed class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object> get props => [];
}

final class LogInInitial extends LogInState {}

final class LogInSuccess extends LogInState {
  const LogInSuccess();
}

final class LogInLoading extends LogInState {}

class LogInEmailNotFound extends LogInState {
  final String email;
  const LogInEmailNotFound({required this.email});
}

final class LogInFailure extends LogInState {
  final String errorMessage;
  final String errorLocalizationKey;
  const LogInFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class LogInNeedVerification extends LogInState {
  final String email;

  const LogInNeedVerification({required this.email});
}
