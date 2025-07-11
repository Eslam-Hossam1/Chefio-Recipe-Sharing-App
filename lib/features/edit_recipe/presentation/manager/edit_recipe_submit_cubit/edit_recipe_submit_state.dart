part of 'edit_recipe_submit_cubit.dart';

sealed class EditRecipeSubmitState extends Equatable {
  const EditRecipeSubmitState();

  @override
  List<Object> get props => [];
}

final class EditRecipeSubmitInitial extends EditRecipeSubmitState {}

final class EditRecipeSubmitLoading extends EditRecipeSubmitState {}

final class EditRecipeSubmitSuccess extends EditRecipeSubmitState {}

final class EditRecipeSubmitFailure extends EditRecipeSubmitState {
  final String errorMessage;
  final String errorLocalizationKey;

  const EditRecipeSubmitFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}
