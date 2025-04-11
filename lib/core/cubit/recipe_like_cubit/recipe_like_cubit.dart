import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/utils/like_recipe_helper.dart';
import 'package:equatable/equatable.dart';

part 'recipe_like_state.dart';

class RecipeLikeCubit extends Cubit<RecipeLikeState> {
  final LikeRecipeHelper _likeRecipeHelper;
  RecipeLikeCubit(this._likeRecipeHelper) : super(RecipeLikeInitial());
  Future<void> likeRecipe({required String recipeId}) async {
    emit(RecipeLikeProcessing());
    var result = await _likeRecipeHelper.likeRecipe(recipeId: recipeId);
    result.fold(
      (failure) {
        emit(RecipeLikeFailed(
            recipeId: recipeId,
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey));
      },
      (success) {
        emit(RecipeLikeSuccess());
      },
    );
  }
}
