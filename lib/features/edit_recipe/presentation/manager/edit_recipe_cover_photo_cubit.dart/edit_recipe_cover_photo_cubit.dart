import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_recipe_cover_photo_state.dart';

class EditRecipeCoverPhotoCubit extends Cubit<EditRecipeCoverPhotoState> {
  final CroppedImagePickerHelper _croppedImagePickerHelper;
  final String imageUrl;
  EditRecipeCoverPhotoCubit({
    required CroppedImagePickerHelper croppedImagePickerHelper,
    required String recipeImageUrl,
  })  : imageUrl = recipeImageUrl,
        _croppedImagePickerHelper = croppedImagePickerHelper,
        super(UrlImage(imageUrl: recipeImageUrl));
  Future<void> pickRecipeImage({required ImageSource imageSource}) async {
    final returnedImage = await _croppedImagePickerHelper
        .pickSquareCroppedImage(imageSource: imageSource);
    if (returnedImage == null) return;
    var recipeImageFile = File(returnedImage.path);
    emit(PickedRecipeImage(recipeImageFile: recipeImageFile));
  }
}
