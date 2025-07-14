import 'dart:convert';

import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_recipe_form_model.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_step_model.dart';
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

    List<Map<String, dynamic>> steps = getSteps();

    var toUploadJson = {
      ApiKeys.recipePicture: foodImage,
      ApiKeys.foodName: foodName,
      ApiKeys.description: foodDescription,
      ApiKeys.cookingDuration: foodCookDuration,
      //    ApiKeys.categoryId: categoryId,
      ApiKeys.ingredients: jsonEncode(ingredients),
      ApiKeys.steps: jsonEncode(steps),
      ...stepsImagesMap
    };
    return toUploadJson;
  }

  List<Map<String, dynamic>> getSteps() {
    List<Map<String, dynamic>> stepsList = [];
    for (int i = 0; i < uploadSteps.length; i++) {
      stepsList.add(uploadSteps[i].toJson(index: i));
    }
    return stepsList;
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

  factory UploadRecipeModel.fromEditRecipeFormModel(
          {required UploadRecipeFormModel uploadRecipeFormModel}) =>
      UploadRecipeModel(
        ingredients: uploadRecipeFormModel.ingredients,
        uploadSteps: uploadRecipeFormModel.steps,
        foodName: uploadRecipeFormModel.foodName,
        foodDescription: uploadRecipeFormModel.foodDescription,
        foodCookDuration: uploadRecipeFormModel.foodCookDuration,
        categoryId: uploadRecipeFormModel.categoryId,
        foodImage: convertToMultipart(
          uploadRecipeFormModel.foodImage,
        )!,
      );
}
