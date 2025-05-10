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
final class ChefHasNoFollowers extends ChefConnectionsState{}
final class ChefHasNoFollowings extends ChefConnectionsState{}
final class ChefConnectionsSuccess extends ChefConnectionsState {}
