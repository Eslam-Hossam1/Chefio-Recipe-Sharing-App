part of 'chef_connections_cubit.dart';

sealed class ChefConnectionsState extends Equatable {
  const ChefConnectionsState();

  @override
  List<Object> get props => [];
}

final class ChefConnectionsInitial extends ChefConnectionsState {}

final class ChefConnectionsLoading extends ChefConnectionsState {}

final class ChefConnectionsFailure extends ChefConnectionsState {
  final String errorMessage;
  final String errorLocalizationKey;

  const ChefConnectionsFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}

final class ChefFollowersSuccess extends ChefConnectionsState {
  final List<ChefFollowerModel> followerModelsList;

  const ChefFollowersSuccess({
    required this.followerModelsList,
  });
}

final class ChefFollowingSuccess extends ChefConnectionsState {
  final List<ChefFollowingModel> followingModelsList;
  const ChefFollowingSuccess({
    required this.followingModelsList,
  });
}
