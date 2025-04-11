part of 'home_recipes_cubit.dart';

sealed class HomeRecipesState extends Equatable {
  const HomeRecipesState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeRecipesState {}

final class HomeRecipesLoadingMore extends HomeRecipesState {}

final class HomeRecipesFirstLoading extends HomeRecipesState {}

final class HomeRecipesSuccess extends HomeRecipesState {}

final class HomeRecipesLoadingMoreFailure extends HomeRecipesState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeRecipesLoadingMoreFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}

final class HomeRecipesFirstFetchFailure extends HomeRecipesState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeRecipesFirstFetchFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}
