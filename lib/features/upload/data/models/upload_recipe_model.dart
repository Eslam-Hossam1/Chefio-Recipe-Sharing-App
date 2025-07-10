import 'dart:convert';

import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/features/upload/data/models/upload_step_model.dart';
import 'package:dio/dio.dart';

class UploadRecipeModel {
  final MultipartFile foodImage;
  final String foodName;
  final String foodDescription;
  final String categoryId;
  final int foodCookDuration;
  final List<String> ingredients;
  final List<UploadStepModel> uploadSteps;
  const UploadRecipeModel({
    required this.ingredients,
    required this.uploadSteps,
    required this.foodName,
    required this.foodDescription,
    required this.foodCookDuration,
    required this.categoryId,
    required this.foodImage,
  });

  Map<String, dynamic> toJson() {

    Map<String, dynamic> stepsImagesMap = getStepsImagesMap();

    Map<String, dynamic> stepsMap = getStepsMap();

    var toUploadJson = {
      ApiKeys.recipePicture: foodImage,
      ApiKeys.foodName: foodName,
      ApiKeys.description: foodDescription,
      ApiKeys.cookingDuration: foodCookDuration,
      ApiKeys.categoryId: categoryId,
      ApiKeys.ingredients: jsonEncode(ingredients),
      ApiKeys.steps: jsonEncode(stepsMap),
      ...stepsImagesMap
    };
    return toUploadJson;
  }

  Map<String, dynamic> getStepsMap() {
       Map<String, dynamic> stepsMap = {};
    for (int i = 0; i < uploadSteps.length; i++) {
      stepsMap['${ApiKeys.stepImage}_$i'] = uploadSteps[i].toJson(index: i);
    }
    return stepsMap;
  }

  Map<String, dynamic> getStepsImagesMap() {
    
    Map<String, dynamic> stepsImagesMap = {};
    for (int i = 0; i < uploadSteps.length; i++) {
      var multipartImage = convertToMultipart(uploadSteps[i].stepImageFile);
      if (multipartImage != null) {
        stepsImagesMap['${ApiKeys.stepImage}_$i'] = multipartImage;
      }
    }
    return stepsImagesMap;
  }
}
