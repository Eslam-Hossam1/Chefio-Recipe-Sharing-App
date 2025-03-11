part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingNextRecipes extends HomeState {}

final class HomefirstLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailureApi extends HomeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeFailureApi(
      {required this.errorMessage, required this.errorLocalizationKey,});
}

final class HomeFailureCacche extends HomeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeFailureCacche(
      {required this.errorMessage, required this.errorLocalizationKey,});
}
final class HomeHasNoMore extends HomeState {}
