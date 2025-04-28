part of 'follow_chef_cubit.dart';

sealed class FollowChefState extends Equatable {
  const FollowChefState();

  @override
  List<Object> get props => [];
}

final class FollowChefInitial extends FollowChefState {}

final class FollowChefSuccess extends FollowChefState {}

final class FollowChefLoading extends FollowChefState {}

final class FollowChefFaiure extends FollowChefState {
  final String errorMessage;
  final String errorLocalizationKey;
  final String chefId;
  const FollowChefFaiure({
    required this.errorMessage,
    required this.errorLocalizationKey,
    required this.chefId,
  });
}
