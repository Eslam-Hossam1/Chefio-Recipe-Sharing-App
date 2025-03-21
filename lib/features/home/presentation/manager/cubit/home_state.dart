part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

//when loading more recipes on scroll
final class HomeLoadingMore extends HomeState {}

//when first open home view  so loading categories and recipes list state
final class HomefirstLoading extends HomeState {}

//when categories is loaded but recipes still loading state
final class HomeFirstLoadingRecipes extends HomeState {}

//to show categories state
final class HomeCategoriesLoaded extends HomeState {

  const HomeCategoriesLoaded();
}

//when home success so display it as normal we have everything we need the recipes and categories
final class HomeSuccess extends HomeState {}

//when loading more recipes fail
final class HomeLoadingMoreFailure extends HomeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeLoadingMoreFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}

//when at first open home view there is error 
final class HomeFirstApiFetchFailure extends HomeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeFirstApiFetchFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}
//when categories is loaded but recipes failed to load
final class HomeFirstRecipesFetchFailure extends HomeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeFirstRecipesFetchFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}
