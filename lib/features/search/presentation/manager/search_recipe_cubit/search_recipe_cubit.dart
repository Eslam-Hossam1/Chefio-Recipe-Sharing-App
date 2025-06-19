import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/features/search/data/repos/search_recipe_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  final SearchRecipeRepo _searchRecipeRepo;
  SearchRecipeCubit(this._searchRecipeRepo) : super(SearchRecipeInitial());
  List<RecipeEntity> recipes = [];
  int page = 0;
  int limit = 30;
  String searchRecipeName = '';
  bool isLoading = false;
  bool hasMoreData = true;

  Future<void> fetchRecipesWithSearchName({
    required String searchRecipeName,
  }) async {
    emit(FirstLoading());
    // Reset all related values for searching again with another searchRecipeName
    recipes.clear();
    page = 0;
    hasMoreData = true;
    isLoading = false;
    this.searchRecipeName = searchRecipeName;
    await fetchMoreRecipes();
  }

  Future<void> trySearchAgain() async {
    //here hasMoreData is true because this method will run only at first search error happens
    // means that (hasMoreData,page,recipes) already not changed so there is no need to reset it all
    emit(FirstLoading());
    await fetchMoreRecipes();
  }

  Future<void> fetchMoreRecipes() async {
    if (isLoading || !hasMoreData) return;
    if (recipes.isNotEmpty) {
      emit(LoadingMore());
    }
    isLoading = true;
    var result = await _searchRecipeRepo.searchRecipe(
      searchRecipeName: searchRecipeName,
      page: page,
      limit: limit,
    );

    result.fold(
      (failure) {
        isLoading = false;
        if (recipes.isEmpty) {
          emit(
            FirstApiFetchFailure(
              errorMessage: failure.errMsg,
              errorLocalizationKey: failure.localizaitonKey,
            ),
          );
        } else {
          emit(
            LoadingMoreFailure(
              errorMessage: failure.errMsg,
              errorLocalizationKey: failure.localizaitonKey,
            ),
          );
        }
      },
      (newRecipes) {
        if (newRecipes.isEmpty && recipes.isEmpty) {
          emit(SearchEmpty());
          return;
        }
        if (newRecipes.length < limit) {
          hasMoreData = false;
        }
        recipes.addAll(newRecipes);
        page += 1;
        isLoading = false;
        emit(SearchSuccess());
      },
    );
  }
}
