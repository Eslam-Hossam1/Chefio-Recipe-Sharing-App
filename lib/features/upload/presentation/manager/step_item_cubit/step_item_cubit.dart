import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'step_item_state.dart';

class StepItemCubit extends Cubit<StepItemState> {
  final CroppedImagePickerHelper _croppedImagePickerHelper;

  StepItemCubit(this._croppedImagePickerHelper) : super(NoImage());

  Future<void> pickAndSetImage({required ImageSource imageSource}) async {
    final returnedImage = await _croppedImagePickerHelper
        .pickSquareCroppedImage(imageSource: imageSource);
    if (returnedImage == null) return;
    var imageFile = File(returnedImage.path);
    emit(PickedSetStepImage(stepImageFile: imageFile));
  }

  void removeImage() {
    emit(NoImage());
  }
}
