import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/services/like_recipe/like_recipe_service.dart';
import 'package:equatable/equatable.dart';

part 'like_recipe_state.dart';

class LikeRecipeCubit extends Cubit<LikeRecipeState> {
  final LikeRecipeService _likeRecipeService;
  LikeRecipeCubit(this._likeRecipeService) : super(LikeRecipeInitial());
  Future<void> toggleLikeRecipe({required String recipeId}) async {
    emit(LikeRecipeProcessing());
    var result = await _likeRecipeService.toggleLikeRecipe(recipeId: recipeId);
    result.fold(
      (failure) {
        emit(LikeRecipeFailed(
            recipeId: recipeId,
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey));
      },
      (success) {
        emit(LikeRecipeSuccess());
      },
    );
  }

  void syncLikeRecipeFromRecipeDetails({required String recipeId}) {
    emit(SyncLikeRecipeFromRecipeDetails(recipeId: recipeId));
  }
}
