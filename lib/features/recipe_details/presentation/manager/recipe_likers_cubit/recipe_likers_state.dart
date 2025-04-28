part of 'recipe_likers_cubit.dart';

sealed class RecipeLikersState extends Equatable {
  const RecipeLikersState();

  @override
  List<Object> get props => [];
}

final class RecipeLikersInitial extends RecipeLikersState {}

final class RecipeLikersLoading extends RecipeLikersState {}

final class RecipeLikersSuccess extends RecipeLikersState {
  final List<RecipeLikerModel> recipeLikers;
  const RecipeLikersSuccess({
    required this.recipeLikers,
  });
}

final class EmptyRecipeLikers extends RecipeLikersState {}

final class RecipeLikersFailure extends RecipeLikersState {
  final String errorMessage;
  final String errorLocalizationKey;

  const RecipeLikersFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });

  @override
  List<Object> get props => [errorMessage, errorLocalizationKey];
}
