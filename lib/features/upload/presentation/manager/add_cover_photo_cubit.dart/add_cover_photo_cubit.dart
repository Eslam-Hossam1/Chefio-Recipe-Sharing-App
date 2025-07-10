import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'add_cover_photo_state.dart';

class AddCoverPhotoCubit extends Cubit<AddCoverPhotoState> {
  final CroppedImagePickerHelper _croppedImagePickerHelper;

  AddCoverPhotoCubit(this._croppedImagePickerHelper)
      : super(EmptyCover());

  Future<void> pickRecipeImage({required ImageSource imageSource}) async {
    final returnedImage = await _croppedImagePickerHelper
        .pickSquareCroppedImage(imageSource: imageSource);
    if (returnedImage == null) return;
    var recipeImageFile = File(returnedImage.path);
    emit(PickedRecipeImage(recipeImageFile: recipeImageFile));
  }
}
