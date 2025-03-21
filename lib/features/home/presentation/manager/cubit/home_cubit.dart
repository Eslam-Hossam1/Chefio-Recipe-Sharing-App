import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  List<Recipe> recipes = [];
  List<Category> categories = [];
  int page = 0;
  int limit = 30;
  bool isLoading = false;
  bool hasMoreData = true;
  String categoryName = '';
  Future<void> fetchCategoriesThenRecipes() async {
    emit(HomefirstLoading());
    var result = await _homeRepo.fetchCategories();
    result.fold((failure) {
      emit(
        HomeFirstApiFetchFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      );
    }, (categories) {
      this.categories = categories;
      categoryName = categories[0].name; 
      emit(
        HomeCategoriesLoaded(),
      );

      fetchRecipes();
    });
  }

  Future<void> fetchRecipesWithChangeCategory(
      {required String categoryName}) async {
    if (categoryName == this.categoryName) {
      return;
    } else {
      emit(HomeFirstLoadingRecipes());

      this.categoryName = categoryName;
      recipes.clear();
      page = 0;
    }
    await fetchRecipes();
  }

  Future<void> refresh() async {
    recipes.clear();
    page = 0;
    if (categories.isEmpty) {
      emit(HomefirstLoading());
      await fetchCategoriesThenRecipes();
    }else{
       emit(HomeFirstLoadingRecipes());
        await fetchRecipes();
    }
   
  }

  Future<void> fetchRecipes() async {
    if (isLoading || !hasMoreData) return;
    if (recipes.isNotEmpty) {
      emit(HomeLoadingMore());
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
            HomeFirstRecipesFetchFailure(
              errorMessage: failure.errMsg,
              errorLocalizationKey: failure.localizaitonKey,
            ),
          );
        } else {
          emit(
            HomeLoadingMoreFailure(
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
        emit(HomeSuccess());
      },
    );
  }
}
