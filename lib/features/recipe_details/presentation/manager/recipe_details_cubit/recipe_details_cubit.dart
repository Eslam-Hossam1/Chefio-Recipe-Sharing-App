import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo.dart';
import 'package:equatable/equatable.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  final RecipeDetailsRepo _recipeDetailsRepo;
  RecipeDetailsModel? recipeDetailModel;
  RecipeDetailsCubit(this._recipeDetailsRepo) : super(RecipeDetailsInitial());
  Future<void> fetchRecipeDetails({required String recipeId}) async {
    emit(RecipeDetailsLoading());
    final result =
        await _recipeDetailsRepo.fetchRecipeDetails(recipeId: recipeId);
    result.fold(
        (failure) => emit(RecipeDetailsFailure(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey)),
        (recipeDetailModel) {
      this.recipeDetailModel = recipeDetailModel;
      emit(
        RecipeDetailsSuccess(),
      );
    });
  }
}
