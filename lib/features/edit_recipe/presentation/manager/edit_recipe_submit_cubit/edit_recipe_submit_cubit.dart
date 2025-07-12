import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo.dart';
import 'package:equatable/equatable.dart';

part 'edit_recipe_submit_state.dart';

class EditRecipeSubmitCubit extends Cubit<EditRecipeSubmitState> {
  final EditRecipeRepo _editRecipeRepo;

  EditRecipeSubmitCubit({required EditRecipeRepo editRecipeRepo})
      : _editRecipeRepo = editRecipeRepo,
        super(EditRecipeSubmitInitial());

  Future<void> editRecipe({required EditRecipeModel editRecipeModel}) async {
    emit(EditRecipeSubmitLoading());

    var result =
        await _editRecipeRepo.editRecipe(editRecipeModel: editRecipeModel);
    result.fold((failure) {
      emit(
        EditRecipeSubmitFailure(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey),
      );
    }, (_) {
      emit(EditRecipeSubmitSuccess());
    });
  }
}
