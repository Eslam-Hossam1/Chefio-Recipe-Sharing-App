part of 'upload_recipe_cubit.dart';

sealed class UploadRecipeState extends Equatable {
  const UploadRecipeState();

  @override
  List<Object> get props => [];
}

final class UploadRecipeInitial extends UploadRecipeState {}
