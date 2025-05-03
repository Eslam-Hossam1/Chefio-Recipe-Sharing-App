part of 'chef_profile_recipes_cubit.dart';

sealed class ChefProfileRecipesState extends Equatable {
  const ChefProfileRecipesState();

  @override
  List<Object> get props => [];
}

final class RecipesInitialFetch extends ChefProfileRecipesState {}

final class RecipesInitialFetchFailure extends ChefProfileRecipesState {
  final String errMsg;
  final String errLocalizationKey;

  const RecipesInitialFetchFailure({
    required this.errMsg,
    required this.errLocalizationKey,
  });
}


final class ChefProfileRecipesInitial extends ChefProfileRecipesState {}

final class FetchMoreChefRecipes extends ChefProfileRecipesState {}

final class FetchMoreRecipesFailure extends ChefProfileRecipesState {
  final String errMsg;
  final String errLocalizationKey;

  const FetchMoreRecipesFailure({
    required this.errMsg,
    required this.errLocalizationKey,
  });
}

final class ChefRecipesSuccess extends ChefProfileRecipesState {}
