import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/chef_profile_recipe_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'chef_profile_recipes_state.dart';

class ChefProfileRecipesCubit extends Cubit<ChefProfileRecipesState> {
  final ProfileRepo _profileRepo;

  ChefProfileRecipesCubit({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo,
        super(ChefProfileRecipesInitial());
  int page = 1;
  int limit = 30;
  bool hasMore = true;
  bool isLoading = false;
  List<ChefProfileRecipeModel> chefRecipes = [];
  Future<void> fetchChefRecipes({required String chefId}) async {
    if (isLoading || !hasMore) return;
    if (chefRecipes.isNotEmpty) {
      emit(FetchMoreChefRecipes());
    } else {
      emit(RecipesInitialFetch());
    }
    var result = await _profileRepo.fetchChefRecipes(
      chefId: chefId,
      page: page,
      limit: limit,
    );
    result.fold((failure) {
      if (chefRecipes.isEmpty) {
        emit(
          RecipesInitialFetchFailure(
            errMsg: failure.errMsg,
            errLocalizationKey: failure.localizaitonKey,
          ),
        );
      } else {
        emit(
          FetchMoreRecipesFailure(
            errMsg: failure.errMsg,
            errLocalizationKey: failure.localizaitonKey,
          ),
        );
      }
    }, (chefRecipes) {
      if (chefRecipes.length <= limit) {
        hasMore = false;
      }
      this.chefRecipes.addAll(chefRecipes);
      page += 1;
      isLoading = false;
      emit(ChefRecipesSuccess());
    });
  }

  Future<void> startWithInitialRecipes({
    required List<ChefProfileRecipeModel> chefInitialRecipes,
    required int limit,
  }) async {
    this.chefRecipes.addAll(chefInitialRecipes);
    this.limit = limit;
    page + 1;
    emit(ChefRecipesSuccess());
  }
}
