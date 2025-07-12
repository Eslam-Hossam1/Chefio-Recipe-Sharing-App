import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_step_item_state.dart';

class EditStepItemCubit extends Cubit<StepItemState> {
  final CroppedImagePickerHelper _croppedImagePickerHelper;

  EditStepItemCubit(this._croppedImagePickerHelper) : super(StepInitial());
  void init({required String? imageUrl}) {
    if (imageUrl != null) {
      emit(UrlImage(imageUrl: imageUrl));
    } else {
      emit(NoImage());
    }
  }

  Future<void> pickAndSetImage({required ImageSource imageSource}) async {
    final returnedImage = await _croppedImagePickerHelper
        .pickSquareCroppedImage(imageSource: imageSource);
    if (returnedImage == null) return;
    var imageFile = File(returnedImage.path);
    emit(NoImage());
    emit(PickedSetStepImage(stepImageFile: imageFile));
  }

  void removeImage() {
    emit(NoImage());
  }
}
