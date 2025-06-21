part of 'my_profile_cubit.dart';

sealed class MyProfileState extends Equatable {
  const MyProfileState();

  @override
  List<Object> get props => [];
}

final class MyProfileInitial extends MyProfileState {}
final class MyProfileLoading extends MyProfileState {}

final class MyProfileSuccess extends MyProfileState {}

final class MyProfileFailure extends MyProfileState {
  final String errMsg;
  final String errLocalizationError;

  const MyProfileFailure({
    required this.errMsg,
    required this.errLocalizationError,
  });
}
