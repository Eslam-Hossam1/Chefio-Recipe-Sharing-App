part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfilePickedImage extends EditProfileState {}

class EditProfileUserNameChange extends EditProfileState {
  final String username;
  const EditProfileUserNameChange(this.username);

  @override
  List<Object> get props => [username];
}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileFailure extends EditProfileState {
  final String errMsg;
  final String errorLocalization;

  const EditProfileFailure(
      {required this.errMsg, required this.errorLocalization});
}

final class EditProfileSuccess extends EditProfileState {}
final class EditProfileImageChanging extends EditProfileState {}
final class EditProfileImageSuccess extends EditProfileState {}
