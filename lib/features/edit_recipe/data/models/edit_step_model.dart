import 'dart:io';

import 'package:chefio_app/core/api/api_keys.dart';

class EditStepModel {
  String stepText;
  File? stepImageFile;
  String? stepUrlImage;

  EditStepModel({
    required this.stepText,
    this.stepImageFile,
    this.stepUrlImage,
  });
  String getImageField({required int index}) {
    if (stepImageFile == null && stepUrlImage == null) {
      return 'null';
    } else if (stepImageFile == null) {
      return stepUrlImage!;
    } else {
      return "${ApiKeys.stepImage}_$index";
    }
  }

  Map<String, dynamic> toJson({required int index}) {
    return {
      ApiKeys.step: stepText,
      ApiKeys.stepImage: getImageField(index: index),
    };
  }
  
}
