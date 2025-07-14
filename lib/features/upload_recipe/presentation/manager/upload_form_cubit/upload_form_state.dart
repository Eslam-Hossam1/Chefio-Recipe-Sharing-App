part of 'upload_form_cubit.dart';

sealed class UploadFormState extends Equatable {
  const UploadFormState();

  @override
  List<Object> get props => [];
}

final class UploadFormInitial extends UploadFormState {}

final class LoadingCategories extends UploadFormState {}

final class CategoriesLoaded extends UploadFormState {}

final class CategoriesFailed extends UploadFormState {
  final String errorMessage;
  final String errorLocalizationKey;

  const CategoriesFailed(
      {required this.errorMessage, required this.errorLocalizationKey});
}
