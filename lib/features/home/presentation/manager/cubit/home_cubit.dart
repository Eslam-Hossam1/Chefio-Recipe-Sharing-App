import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/features/home/data/enums/category_type_enum.dart';
import 'package:chefio_app/features/home/data/models/category_model.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  List<Recipe> recipes = [];
  int page = 0;
  int limit = 30;
  bool isLoading = false;
  bool hasMoreData = true;
  CategoryType categoryType = CategoryType.generalDishes;
  Future<void> fetchRecipesWithChangeCategory(
      {required CategoryType categorytype}) async {
    if (categorytype == this.categoryType) {
      return;
    } else {
      emit(HomefirstLoading());

      this.categoryType = categorytype;
      recipes.clear();
      page = 0;
    }
    await fetchRecipes();
  }

  Future<void> refresh() async {
    recipes.clear();
    page = 0;
    emit(HomefirstLoading());
    await fetchRecipes();
  }

  Future<void> firstFetchRecipes() async {
    emit(HomefirstLoading());
    await fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    if (isLoading || !hasMoreData) return;
    if (recipes.isNotEmpty) {
      emit(HomeLoadingMore());
    }
    isLoading = true;

    var result = await _homeRepo.fetchRecipesFromApi(
      categoryName: this.categoryType.name,
      page: page,
      limit: limit,
    );
    result.fold(
      (failure) {
        isLoading = false;
        if (recipes.isEmpty) {
          emit(
            HomeFirstApiFetchFailure(
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
