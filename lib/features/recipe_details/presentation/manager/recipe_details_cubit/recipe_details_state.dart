part of 'recipe_details_cubit.dart';

sealed class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();

  @override
  List<Object> get props => [];
}

final class RecipeDetailsInitial extends RecipeDetailsState {}

final class RecipeDetailsFailure extends RecipeDetailsState {
  final String errorMessage;
  final String errorLocalizationKey;

  const RecipeDetailsFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}

final class RecipeDetailsLoading extends RecipeDetailsState {}

final class RecipeDetailsSuccess extends RecipeDetailsState {
  const RecipeDetailsSuccess();
}
