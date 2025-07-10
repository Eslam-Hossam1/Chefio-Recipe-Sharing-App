part of 'chef_liked_recipes_cubit.dart';

sealed class ChefLikedRecipesState extends Equatable {
  const ChefLikedRecipesState();

  @override
  List<Object> get props => [];
}

final class ChefLikedRecipesInitial extends ChefLikedRecipesState {}

final class LikedRecipesInitialFetch extends ChefLikedRecipesState {}

final class LikedRecipesInitialFetchFailure extends ChefLikedRecipesState {
  final String errMsg;
  final String errLocalizationKey;

  const LikedRecipesInitialFetchFailure({
    required this.errMsg,
    required this.errLocalizationKey,
  });
}

final class FetchMoreLikedRecipes extends ChefLikedRecipesState {}

final class FetchMoreLikedRecipesFailure extends ChefLikedRecipesState {
  final String errMsg;
  final String errLocalizationKey;

  const FetchMoreLikedRecipesFailure({
    required this.errMsg,
    required this.errLocalizationKey,
  });
}

final class ChefLikedRecipesSuccess extends ChefLikedRecipesState {}

final class EmptyChefLikedRecipes extends ChefLikedRecipesState {}

final class MyProfileEmptyLikedRecipes extends ChefLikedRecipesState {}
