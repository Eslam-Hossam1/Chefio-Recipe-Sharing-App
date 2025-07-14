import 'dart:io';

import 'package:chefio_app/core/api/api_keys.dart';

class UploadStepModel {
  String stepText;
  File? stepImageFile;

  UploadStepModel({required this.stepText, this.stepImageFile});
  Map<String, dynamic> toJson({required int index}) {
    return {
      ApiKeys.step:stepText,
      ApiKeys.stepImage:stepImageFile==null? 'null' :"${ApiKeys.stepImage}_$index"
    };
  }
}
