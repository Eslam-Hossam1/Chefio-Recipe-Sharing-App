part of 'profile_follow_button_cubit.dart';

sealed class ProfileFollowButtonState extends Equatable {
  const ProfileFollowButtonState();

  @override
  List<Object> get props => [];
}

final class MyProfile extends ProfileFollowButtonState {}

final class NotMyProfile extends ProfileFollowButtonState {}
