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

final class LogInLoadingWithEmailAndPassword extends LogInState {}
final class LogInLoadingWithGoogle extends LogInState {}

final class LogInFailure extends LogInState {
  final String errorMessage;

 const  LogInFailure({required this.errorMessage});
}
final class LogInNeedVerification extends LogInState {
  final String email;

 const  LogInNeedVerification({required this.email});
}
