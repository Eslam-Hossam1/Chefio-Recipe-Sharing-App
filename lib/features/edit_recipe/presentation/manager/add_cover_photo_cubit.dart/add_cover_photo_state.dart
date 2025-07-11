part of 'add_cover_photo_cubit.dart';

sealed class AddCoverPhotoState extends Equatable {
  const AddCoverPhotoState();

  @override
  List<Object> get props => [];
}

final class AddCoverPhotoInitial extends AddCoverPhotoState {}

final class EmptyCover extends AddCoverPhotoState {}

final class UrlImage extends AddCoverPhotoState {
  final String imageUrl;

  const UrlImage({required this.imageUrl});
}

final class PickedRecipeImage extends AddCoverPhotoState {
  final File recipeImageFile;

  const PickedRecipeImage({required this.recipeImageFile});
}
