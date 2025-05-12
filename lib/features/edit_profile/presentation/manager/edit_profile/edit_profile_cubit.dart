import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:chefio_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:chefio_app/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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
  String chefName = '';
  File? chefProfilePicture;
  Future<void> editProfile() async {
    emit(EditProfileLoading());
    final editProfileModel = createEditProfileModel();
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

  Future<void> pickRecipeImage({required ImageSource imageSource}) async {
    final returnedImage = await _croppedImagePickerHelper
        .pickSquareCroppedImage(imageSource: imageSource);
    if (returnedImage == null) return;
    chefProfilePicture = File(returnedImage.path);

    emit(EditProfilePickedImage());
  }

  void onChangeUsername({required String username}) {
    chefName = username;
    emit(EditProfileUserNameChange(username));
  }

  EditProfileModel createEditProfileModel() {
    final editProfileModel = EditProfileModel(
      chefProfilePicture: convertToMultipart(chefProfilePicture),
      chefUsername: chefName,
    );
    return editProfileModel;
  }
}
