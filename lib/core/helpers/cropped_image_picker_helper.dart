import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CroppedImagePickerHelper {
  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  const CroppedImagePickerHelper(this._imagePicker, this._imageCropper);

  Future<CroppedFile?> pickSquareCroppedImage({
    required ImageSource imageSource,
  }) async {
    return pickCustomCroppedImage(
      imageSource: imageSource,
      cropFunction: cropSquareImage,
    );
  }

  Future<CroppedFile?> pickCustomCroppedImage({
    required ImageSource imageSource,
    Future<CroppedFile?> Function(File file)? cropFunction,
  }) async {
    final pickedImage = await _imagePicker.pickImage(source: imageSource);
    if (pickedImage == null) return null;

    final file = File(pickedImage.path);
    return cropFunction != null ? cropFunction(file) : null;
  }

  Future<CroppedFile?> cropSquareImage(File imageFile) async {
    return await _imageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          aspectRatioLockEnabled: true,
        ),
      ],
    );
  }
}
