part of 'upload_recipe_cubit.dart';

sealed class UploadRecipeState extends Equatable {
  const UploadRecipeState();

  @override
  List<Object> get props => [];
}

final class UploadRecipeInitial extends UploadRecipeState {}
final class LoadingCategories extends UploadRecipeState {}
final class CategoriesLoaded extends UploadRecipeState {}
final class CategoriesFailed extends UploadRecipeState {
   final String errorMessage;
  final String errorLocalizationKey;

 const  CategoriesFailed({required this.errorMessage, required this.errorLocalizationKey});

}
final class UploadRecipeLoading extends UploadRecipeState {}
final class UploadRecipeSuccess extends UploadRecipeState {}
final class UploadRecipeFailed extends UploadRecipeState {
     final String errorMessage;
  final String errorLocalizationKey;

 const UploadRecipeFailed({required this.errorMessage, required this.errorLocalizationKey});

}
