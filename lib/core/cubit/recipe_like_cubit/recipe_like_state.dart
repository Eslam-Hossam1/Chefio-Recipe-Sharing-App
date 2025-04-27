part of 'recipe_like_cubit.dart';

sealed class RecipeLikeState extends Equatable {
  const RecipeLikeState();

  @override
  List<Object> get props => [];
}

final class RecipeLikeInitial extends RecipeLikeState {}

final class RecipeLikeSuccess extends RecipeLikeState {}
final class RecipeLikeProcessing extends RecipeLikeState {}
final class SyncRecipeLikedFromRecipeDetails extends RecipeLikeState {
  final String recipeId;
  const SyncRecipeLikedFromRecipeDetails({required this.recipeId});
}
final class RecipeLikeFailed extends RecipeLikeState {
  final String errorMessage;
  final String errorLocalizationKey;
  final String recipeId;
  const RecipeLikeFailed(
      {required this.errorMessage, required this.errorLocalizationKey,required this.recipeId, });
}
