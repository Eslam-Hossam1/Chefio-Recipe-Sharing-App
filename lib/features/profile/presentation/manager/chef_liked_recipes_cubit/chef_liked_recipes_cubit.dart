import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'chef_liked_recipes_state.dart';

class ChefLikedRecipesCubit extends Cubit<ChefLikedRecipesState> {
  final ProfileRepo _profileRepo;
  final AuthCredentialsHelper _authCredentialsHelper;
  ChefLikedRecipesCubit({
    required ProfileRepo profileRepo,
    required AuthCredentialsHelper authCredentialsHelper,
  })  : _profileRepo = profileRepo,
        _authCredentialsHelper = authCredentialsHelper,
        super(ChefLikedRecipesInitial());
  int page = 1;
  int limit = Constants.recipesLimit;
  bool hasMore = true;
  bool isLoading = false;
  List<RecipeEntity> chefLikedRecipes = [];
  String? chefId;
  Future<void> fetchChefLikedRecipes({required String chefId}) async {
    this.chefId = chefId;
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
        if (chefId == _authCredentialsHelper.userId) {
          emit(MyProfileEmptyLikedRecipes());
        } else {
          emit(EmptyChefLikedRecipes());
        }
        return;
      }
      this.chefLikedRecipes.addAll(chefLikedRecipes);
      page += 1;
      isLoading = false;
      emit(ChefLikedRecipesSuccess());
    });
  }

  Future<void> refersh({required String chefId}) async {
    page = 1;
    hasMore = true;
    isLoading = false;
    chefLikedRecipes.clear();
    emit(ChefLikedRecipesInitial()); // نرجع للحالة المبدئية مثلاً
    await fetchChefLikedRecipes(chefId: chefId);
  }
}
