import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/utils/auth_credentials_helper.dart';
import 'package:equatable/equatable.dart';

part 'recipe_details_actions_state.dart';

class RecipeDetailsActionsCubit extends Cubit<RecipeDetailsActionsState> {
  final AuthCredentialsHelper authCredentialsHelper;
  RecipeDetailsActionsCubit({required this.authCredentialsHelper})
      : super(RecipeDetailsActionsInitial());
  void checkIsMyRecipe({required String recipeCreatorId}) {
    var loggedInUserId = authCredentialsHelper.userId;
    if (recipeCreatorId == loggedInUserId) {
      emit(MyRecipe());
    } else {
      emit(NotMyRecipe());
    }
  }
}
