part of 'edit_recipe_form_cubit.dart';

sealed class UploadFormState extends Equatable {
  const UploadFormState();

  @override
  List<Object> get props => [];
}

final class UploadFormInitial extends UploadFormState {}


final class CategoriesLoaded extends UploadFormState {}

