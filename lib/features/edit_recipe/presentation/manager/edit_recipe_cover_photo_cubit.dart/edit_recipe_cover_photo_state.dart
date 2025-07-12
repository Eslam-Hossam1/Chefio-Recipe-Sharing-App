part of 'edit_recipe_cover_photo_cubit.dart';

sealed class EditRecipeCoverPhotoState extends Equatable {
  const EditRecipeCoverPhotoState();

  @override
  List<Object> get props => [];
}

final class EditRecipeCoverPhotoInitial extends EditRecipeCoverPhotoState {}

final class EmptyCover extends EditRecipeCoverPhotoState {}

final class UrlImage extends EditRecipeCoverPhotoState {
  final String imageUrl;

  const UrlImage({required this.imageUrl});
}
// ✅ Represents a newly picked image with a unique timestamp to force state change
final class PickedRecipeImage extends EditRecipeCoverPhotoState {
  final File recipeImageFile;
  final DateTime timestamp; // Used to distinguish repeated identical image states

  const PickedRecipeImage({
    required this.recipeImageFile,
    required this.timestamp,
  });

  @override
  List<Object> get props => [recipeImageFile, timestamp]; // Ensures the state is always unique
}
