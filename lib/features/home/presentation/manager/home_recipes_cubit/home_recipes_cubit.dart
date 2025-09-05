import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/errors/error_codes.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_recipes_state.dart';

class HomeRecipesCubit extends Cubit<HomeRecipesState> {
  HomeRecipesCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  List<RecipeEntity> recipes = [];
  int page = 0;
  int limit = Constants.recipesLimit;
  bool isLoading = false;
  bool hasMoreData = true;
  String categoryName = '';

  Future<void> fetchRecipesWithChangeCategory(
      {required String categoryName}) async {
    if (categoryName == this.categoryName) {
      return;
    } else {
      this.categoryName = categoryName;
      recipes.clear();
      page = 0;
      hasMoreData = true;
    }
    emit(HomeRecipesFirstLoading());

    await fetchRecipes();
  }

  Future<void> firstFetchRecipes() async {
    emit(HomeRecipesFirstLoading());
    await fetchRecipes();
  }

  Future<void> refreshRecipes() async {
    recipes.clear();
    page = 0;
    hasMoreData = true;
    categoryName = '';
    emit(HomeRecipesFirstLoading());

    await fetchRecipes();
  }

  Future<void> fetchMoreRecipes() async {
    var nowState = state;
    // To disable flickering in (no internet connection in first-fetch failure) state
    // The Pull-to-Refresh package causes a fake scroll event even if the list is empty,
    // which would normally trigger a "fetch more" while scrolling to bottom.
    // So what i did is to add this check to handle that state,
    if (nowState is HomeRecipesFirstFetchFailure &&
        nowState.errorCode == ErrorCodes.noInternetConnection) {
      return;
    }
    emit(HomeRecipesLoadingMore());
    await fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    if (isLoading || !hasMoreData) return;
    isLoading = true;
    var result = await _homeRepo.fetchRecipesFromApi(
      categoryName: categoryName,
      page: page,
      limit: limit,
    );
    result.fold(
      (failure) {
        isLoading = false;
        if (recipes.isEmpty) {
          emit(
            HomeRecipesFirstFetchFailure(
              errorMessage: failure.errMsg,
              errorLocalizationKey: failure.localizaitonKey,
              errorCode: failure.errCode,
            ),
          );
        } else {
          emit(
            HomeRecipesLoadingMoreFailure(
              errorMessage: failure.errMsg,
              errorLocalizationKey: failure.localizaitonKey,
            ),
          );
        }
      },
      (newRecipes) {
        if (newRecipes.isEmpty && recipes.isEmpty) {
          hasMoreData = false;
          isLoading = false;
          emit(HomeRecipesEmpty());
          return;
        }

        if (newRecipes.length < limit) {
          hasMoreData = false;
        }

        recipes.addAll(newRecipes);
        page += 1;
        isLoading = false;
        emit(HomeRecipesSuccess());
      },
    );
  }
}
