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
    required this.imageUrl,
  })  : _croppedImagePickerHelper = croppedImagePickerHelper,
        super(UrlImage(imageUrl: imageUrl));
  Future<void> pickRecipeImage({required ImageSource imageSource}) async {
    final returnedImage = await _croppedImagePickerHelper
        .pickSquareCroppedImage(imageSource: imageSource);
    if (returnedImage == null) return;
    var recipeImageFile = File(returnedImage.path);
    // Emit a new state with timestamp to avoid Bloc ignoring identical states
    emit(
      PickedRecipeImage(
        recipeImageFile: recipeImageFile,
        timestamp: DateTime.now(),
      ),
    );
  }

  void removeImageFile() => emit(UrlImage(imageUrl: imageUrl));
}
