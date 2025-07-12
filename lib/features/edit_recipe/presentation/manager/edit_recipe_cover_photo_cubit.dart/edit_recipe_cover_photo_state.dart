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

final class PickedRecipeImage extends EditRecipeCoverPhotoState {
  final File recipeImageFile;

  const PickedRecipeImage({
    required this.recipeImageFile,
  });

  @override
  List<Object> get props => [recipeImageFile];
}
