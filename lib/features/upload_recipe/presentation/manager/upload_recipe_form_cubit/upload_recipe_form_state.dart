part of 'upload_recipe_form_cubit.dart';

sealed class UploadRecipeFormState extends Equatable {
  const UploadRecipeFormState();

  @override
  List<Object> get props => [];
}

final class UploadFormInitial extends UploadRecipeFormState {}

final class LoadingCategories extends UploadRecipeFormState {}

final class CategoriesLoaded extends UploadRecipeFormState {}

final class CategoriesFailed extends UploadRecipeFormState {
  final String errorMessage;
  final String errorLocalizationKey;

  const CategoriesFailed(
      {required this.errorMessage, required this.errorLocalizationKey});
}
