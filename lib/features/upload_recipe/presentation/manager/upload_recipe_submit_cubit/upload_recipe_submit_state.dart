part of 'upload_recipe_submit_cubit.dart';

sealed class UploadRecipeSubmitState extends Equatable {
  const UploadRecipeSubmitState();

  @override
  List<Object> get props => [];
}

final class UploadSubmitInitial extends UploadRecipeSubmitState {}

final class UploadSubmitLoading extends UploadRecipeSubmitState {}

final class UploadSubmitSuccess extends UploadRecipeSubmitState {}

final class UploadSubmitFailure extends UploadRecipeSubmitState {
  final String errorMessage;
  final String errorLocalizationKey;

  const UploadSubmitFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}
