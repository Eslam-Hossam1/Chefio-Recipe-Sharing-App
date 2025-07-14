import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload_recipe/data/repos/upload_recipe_repo.dart';
import 'package:equatable/equatable.dart';

part 'upload_recipe_submit_state.dart';

class UploadRecipeSubmitCubit extends Cubit<UploadRecipeSubmitState> {
  final UploadRecipeRepo _uploadRepo;

  UploadRecipeSubmitCubit({required UploadRecipeRepo uploadRepo})
      : _uploadRepo = uploadRepo,
        super(UploadSubmitInitial());

  Future<void> uploadRecipe(
      {required UploadRecipeModel uploadRecipeModel}) async {
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
