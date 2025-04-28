import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/errors/error_codes.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_liker_model/recipe_liker_model.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo.dart';
import 'package:equatable/equatable.dart';

part 'recipe_likers_state.dart';

class RecipeLikersCubit extends Cubit<RecipeLikersState> {
  RecipeLikersCubit(this._recipeDetailsRepo) : super(RecipeLikersInitial());
  final RecipeDetailsRepo _recipeDetailsRepo;

  Future<void> fetchRecipeLikers({required String recipeId}) async {
    emit(RecipeLikersLoading());
    final result =
        await _recipeDetailsRepo.fetchRecipeLikers(recipeId: recipeId);
    result.fold(
      (failure) {
        if (failure.errCode == ErrorCodes.notFound) {
          emit(EmptyRecipeLikers());
        } else {
          emit(
          RecipeLikersFailure(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey,
          ),
        );
        }
        
      },
      (recipeLikerModel) {
        emit(
          RecipeLikersSuccess(
            recipeLikers: recipeLikerModel,
          ),
        );
      },
    );
  }
}
