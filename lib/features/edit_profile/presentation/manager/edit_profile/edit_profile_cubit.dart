import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:chefio_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:chefio_app/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final CroppedImagePickerHelper _croppedImagePickerHelper;
  final EditProfileRepo _editProfileRepo;

  EditProfileCubit({
    required CroppedImagePickerHelper croppedImagePickerHelper,
    required EditProfileRepo editProfileRepo,
  })  : _croppedImagePickerHelper = croppedImagePickerHelper,
        _editProfileRepo = editProfileRepo,
        super(EditProfileInitial());

  Future<void> editProfile({required EditProfileModel editProfileModel}) async {
    emit(EditProfileLoading());
    final result = await _editProfileRepo.editProfile(
      editProfileModel: editProfileModel,
    );
    result.fold(
      (failure) => emit(
        EditProfileFailure(
          errMsg: failure.errMsg,
          errorLocalization: failure.localizaitonKey,
        ),
      ),
      (succes) => emit(
        EditProfileSuccess(),
      ),
    );
  }
}
