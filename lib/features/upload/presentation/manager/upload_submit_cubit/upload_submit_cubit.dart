import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/upload/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo.dart';
import 'package:equatable/equatable.dart';

part 'upload_submit_state.dart';

class UploadSubmitCubit extends Cubit<UploadSubmitState> {
  final UploadRepo _uploadRepo;

  UploadSubmitCubit({required UploadRepo uploadRepo})
      : _uploadRepo = uploadRepo,
        super(UploadSubmitInitial());
  
  Future<void> editRecipe({required EditRecipeModel editRecipeModel}) async {
    emit(UploadSubmitLoading());

    var result = await _uploadRepo.editRecipe(editRecipeModel: editRecipeModel);
    result.fold((failure) {
      emit(
        UploadSubmitFailure(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey),
      );
    }, (_) {
      emit(UploadSubmitSuccess());
    });
  }

  Future<void> uploadRecipe({required UploadRecipeModel uploadRecipeModel}) async {
    emit(UploadSubmitLoading());
    var result =
        await _uploadRepo.uploadRecipe(uploadRecipeModel: uploadRecipeModel);
    result.fold((failure) {
      emit(
        UploadSubmitFailure(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey),
      );
    }, (_) {
      emit(UploadSubmitSuccess());
    });
  }


}
