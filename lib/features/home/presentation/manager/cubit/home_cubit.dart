import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/features/home/data/enums/category_type_enum.dart';
import 'package:chefio_app/features/home/data/models/category_model.dart';
import 'package:chefio_app/features/home/data/models/recipe_model/recipe_model.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  List<RecipeModel> recipes = [];
  int skip = 0;
  int limit = 30;
  bool isLoading = false;
  bool hasMoreData = true;
  CategoryType categoryType = CategoryType.all;
  Future<void> fetchRecipesWithCategory(
      {required CategoryType categorytype}) async {
    if (categorytype == this.categoryType) {
      return;
    } else {
      this.categoryType = categorytype;
      recipes.clear();
      skip = 0;
    }
    await fetchRecipes();
  }

  Future<void> refresh() async {
    recipes.clear();
    skip = 0;
    await fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    if (isLoading || !hasMoreData) return;
    isLoading = true;
    emit(HomeLoadingNextRecipes());

    var result = await _homeRepo.fetchRecipesFromApi(
      categoryName: this.categoryType.name,
      skip: skip,
      limit: limit,
    );
    result.fold(
      (failure) {
        isLoading = false;
        emit(HomeFailureApi(
            errorMessage: failure.localizaitonKey,
            errorLocalizationKey: failure.errCode));
      },
      (newRecipes) {
        if (newRecipes.length < limit) {
          hasMoreData = false;
        }
        recipes.addAll(newRecipes);
        skip += limit;
        isLoading = false;
        emit(HomeSuccess());
      },
    );
  }
}
