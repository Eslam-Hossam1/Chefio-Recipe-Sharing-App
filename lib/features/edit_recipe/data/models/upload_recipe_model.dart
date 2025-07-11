import 'dart:convert';

import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/features/upload/data/models/upload_step_image_model.dart';
import 'package:dio/dio.dart';

class UploadRecipeModel {
  final MultipartFile foodImage;
  final String foodName;
  final String foodDescription;
  final String categoryId;
  final int foodCookDuration;
  final List<String> ingredients;
  final List<String> steps;
  final List<UploadStepImageModel> stepsImageModels;
  const UploadRecipeModel({
    required this.ingredients,
    required this.steps,
    required this.foodName,
    required this.foodDescription,
    required this.foodCookDuration,
    required this.categoryId,
    required this.foodImage,
    required this.stepsImageModels,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> stepsImagesMap = {};
    for (var step in stepsImageModels) {
      var multipartImage = convertToMultipart(step.stepImageFile);
      if (multipartImage != null) {
        stepsImagesMap[ApiKeys.stepImage + step.stepIndex.toString()] =
            multipartImage;
      }
    }
    var toUploadJson = {
      ApiKeys.recipePicture: foodImage,
      ApiKeys.foodName: foodName,
      ApiKeys.description: foodDescription,
      ApiKeys.cookingDuration: foodCookDuration,
      ApiKeys.categoryId: categoryId,
      ApiKeys.ingredients: jsonEncode(ingredients),
      ApiKeys.steps: jsonEncode(steps),
      ...stepsImagesMap
    };
    return toUploadJson;
  }
}
