part of 'like_recipe_cubit.dart';

sealed class LikeRecipeState extends Equatable {
  const LikeRecipeState();

  @override
  List<Object> get props => [];
}

final class LikeRecipeInitial extends LikeRecipeState {}

final class LikeRecipeSuccess extends LikeRecipeState {}

final class LikeRecipeProcessing extends LikeRecipeState {}

final class SyncLikeRecipeFromRecipeDetails extends LikeRecipeState {
  final String recipeId;
  const SyncLikeRecipeFromRecipeDetails({required this.recipeId});
}

final class LikeRecipeFailed extends LikeRecipeState {
  final String errorMessage;
  final String errorLocalizationKey;
  final String recipeId;
  const LikeRecipeFailed({
    required this.errorMessage,
    required this.errorLocalizationKey,
    required this.recipeId,
  });
}
