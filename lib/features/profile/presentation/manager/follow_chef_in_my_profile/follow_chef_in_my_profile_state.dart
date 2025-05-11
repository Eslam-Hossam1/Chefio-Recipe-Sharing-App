part of 'follow_chef_in_my_profile_cubit.dart';

sealed class FollowChefInMyProfileState extends Equatable {
  const FollowChefInMyProfileState();

  @override
  List<Object> get props => [];
}

final class FollowChefInMyProfileInitial extends FollowChefInMyProfileState {}

final class FollowChefInMyProfileProcessing extends FollowChefInMyProfileState
    implements FollowChefInMyProfileStateWithConnectionEntity {
  @override
  final ChefConnectionEntity chefFollowing;
  const FollowChefInMyProfileProcessing({required this.chefFollowing});
}

final class FollowChefInMyProfileFailure extends FollowChefInMyProfileState
    implements FollowChefInMyProfileStateWithConnectionEntity {
  @override
  final ChefConnectionEntity chefFollowing;
  final String errLocalization;

  const FollowChefInMyProfileFailure({
    required this.errLocalization,
    required this.chefFollowing,
  });
}

final class FollowChefInMyProfileSuccess extends FollowChefInMyProfileState {}

abstract class FollowChefInMyProfileStateWithConnectionEntity {
  final ChefConnectionEntity chefFollowing;

  FollowChefInMyProfileStateWithConnectionEntity({required this.chefFollowing});
}
