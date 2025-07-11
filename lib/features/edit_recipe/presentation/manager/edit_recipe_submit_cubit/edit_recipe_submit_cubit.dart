import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo.dart';
import 'package:equatable/equatable.dart';

part 'edit_recipe_submit_state.dart';

class EditRecipeSubmitCubit extends Cubit<EditRecipeSubmitState> {
  final EditRecipeRepo _uploadRepo;

  EditRecipeSubmitCubit({required EditRecipeRepo uploadRepo})
      : _uploadRepo = uploadRepo,
        super(EditRecipeSubmitInitial());

  Future<void> editRecipe({required EditRecipeModel editRecipeModel}) async {
    emit(EditRecipeSubmitLoading());

    var result = await _uploadRepo.editRecipe(editRecipeModel: editRecipeModel);
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
