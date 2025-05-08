import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'chef_liked_recipes_state.dart';

class ChefLikedRecipesCubit extends Cubit<ChefLikedRecipesState> {
  final ProfileRepo _profileRepo;
  ChefLikedRecipesCubit({
    required ProfileRepo profileRepo,
  })  : _profileRepo = profileRepo,
        super(ChefLikedRecipesInitial());
  int page = 1;
  int limit = 30;
  bool hasMore = true;
  bool isLoading = false;
  List<RecipeEntity> chefLikedRecipes = [];

  Future<void> fetchChefLikedRecipes({required String chefId}) async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    if (chefLikedRecipes.isNotEmpty) {
      emit(FetchMoreLikedRecipes());
    } else {
      emit(LikedRecipesInitialFetch());
    }

    final result = await _profileRepo.fetchChefLikedRecipes(
      chefId: chefId,
      limit: limit,
      page: page,
    );

    result.fold((failure) {
      if (chefLikedRecipes.isEmpty) {
        emit(
          LikedRecipesInitialFetchFailure(
            errMsg: failure.errMsg,
            errLocalizationKey: failure.localizaitonKey,
          ),
        );
      } else {
        emit(
          FetchMoreLikedRecipesFailure(
            errMsg: failure.errMsg,
            errLocalizationKey: failure.localizaitonKey,
          ),
        );
      }
    }, (chefLikedRecipes) {
      if (chefLikedRecipes.length <= limit) {
        hasMore = false;
      }
      if (chefLikedRecipes.isEmpty && this.chefLikedRecipes.isEmpty) {
        isLoading = false;
        emit(EmptyChefLikedRecipes());
        return;
      }
      this.chefLikedRecipes.addAll(chefLikedRecipes);
      page += 1;
      isLoading = false;
      emit(ChefLikedRecipesSuccess());
    });
  }
}
