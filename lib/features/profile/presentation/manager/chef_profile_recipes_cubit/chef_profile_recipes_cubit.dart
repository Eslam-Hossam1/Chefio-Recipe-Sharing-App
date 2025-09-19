import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Entities/recipe_body_entity.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/chef_profile_recipe_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'chef_profile_recipes_state.dart';

class ChefProfileRecipesCubit extends Cubit<ChefProfileRecipesState> {
  final ProfileRepo _profileRepo;
  final AuthCredentialsHelper _authCredentialsHelper;
  ChefProfileRecipesCubit({
    required ProfileRepo profileRepo,
    required AuthCredentialsHelper authCredentialsHelper,
  })  : _profileRepo = profileRepo,
        _authCredentialsHelper = authCredentialsHelper,
        super(ChefProfileRecipesInitial());
  int page = 1;
  int limit = Constants.recipesLimit;
  bool hasMore = true;
  bool isLoading = false;
  List<RecipeBodyEntity> chefRecipes = [];
  Future<void> fetchChefRecipes({required String chefId}) async {
    if (isLoading || !hasMore) return;
    isLoading = true;
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
      isLoading = false;
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
      isLoading = false;
      if (chefRecipes.length < limit) {
        hasMore = false;
      }
      if (chefRecipes.isEmpty && this.chefRecipes.isEmpty) {
        if (chefId == _authCredentialsHelper.userId) {
          emit(MyProfileEmptyRecipes());
        } else {
          emit(EmptyChefRecipes());
        }
        return;
      }
      this.chefRecipes.addAll(chefRecipes);
      page += 1;
      emit(ChefRecipesSuccess());
    });
  }

  void startWithInitialRecipes({
    required List<ChefProfileRecipeModel> chefInitialRecipes,
    required String chefId,
  }) {
    if (chefInitialRecipes.length < limit) {
      hasMore = false;
    }
    if (chefInitialRecipes.isEmpty && chefRecipes.isEmpty) {
      if (chefId == _authCredentialsHelper.userId) {
        emit(MyProfileEmptyRecipes());
      } else {
        emit(EmptyChefRecipes());
      }
      return;
    }
    chefRecipes.clear();
    chefRecipes.addAll(chefInitialRecipes);
    page += 1;
    emit(ChefRecipesSuccess());
  }
}
