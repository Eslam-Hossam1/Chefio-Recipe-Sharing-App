part of 'recipe_details_actions_cubit.dart';

sealed class RecipeDetailsActionsState extends Equatable {
  const RecipeDetailsActionsState();

  @override
  List<Object> get props => [];
}

final class RecipeDetailsActionsInitial extends RecipeDetailsActionsState {}
final class MyRecipe extends RecipeDetailsActionsState {}
final class NotMyRecipe extends RecipeDetailsActionsState {}
