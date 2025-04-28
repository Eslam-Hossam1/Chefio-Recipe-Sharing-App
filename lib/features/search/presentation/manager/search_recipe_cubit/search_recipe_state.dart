part of 'search_recipe_cubit.dart';

sealed class SearchRecipeState extends Equatable {
  const SearchRecipeState();

  @override
  List<Object> get props => [];
}

final class SearchRecipeInitial extends SearchRecipeState {}

final class LoadingMore extends SearchRecipeState {}

final class FirstLoading extends SearchRecipeState {}

final class LoadingMoreFailure extends SearchRecipeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const LoadingMoreFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}

final class FirstApiFetchFailure extends SearchRecipeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const FirstApiFetchFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}

final class SearchSuccess extends SearchRecipeState {}
