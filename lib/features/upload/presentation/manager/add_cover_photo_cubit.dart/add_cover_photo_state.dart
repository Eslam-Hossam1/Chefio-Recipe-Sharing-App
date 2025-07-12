part of 'add_cover_photo_cubit.dart';

sealed class AddCoverPhotoState extends Equatable {
  const AddCoverPhotoState();

  @override
  List<Object> get props => [];
}

final class AddCoverPhotoInitial extends AddCoverPhotoState {}

final class EmptyCover extends AddCoverPhotoState {}


// ✅ Represents a newly picked image with a unique timestamp to force state change
final class PickedRecipeImage extends AddCoverPhotoState {
  final File recipeImageFile;
  final DateTime timestamp; // Used to distinguish repeated identical image states

  const PickedRecipeImage({
    required this.recipeImageFile,
    required this.timestamp,
  });

  @override
  List<Object> get props => [recipeImageFile, timestamp]; // Ensures the state is always unique
}
