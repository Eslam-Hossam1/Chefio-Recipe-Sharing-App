import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_recipes_state.dart';

class HomeRecipesCubit extends Cubit<HomeRecipesState> {
  HomeRecipesCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  List<RecipeEntity> recipes = [];
  int page = 0;
  int limit = 30;
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
    await fetchRecipes();
  }

  Future<void> refreshRecipes() async {
    recipes.clear();
    page = 0;
    hasMoreData = true;
    categoryName = '';
    await fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    if (isLoading || !hasMoreData) return;
    if (recipes.isNotEmpty) {
      emit(HomeRecipesLoadingMore());
    } else {
      emit(HomeRecipesFirstLoading());
    }
    isLoading = true;

    var result = await _homeRepo.fetchRecipesFromApi(
      categoryName: this.categoryName,
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
