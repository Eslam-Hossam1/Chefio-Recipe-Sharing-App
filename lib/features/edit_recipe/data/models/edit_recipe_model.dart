import 'dart:convert';

import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_step_model.dart';
import 'package:dio/dio.dart';

class EditRecipeModel {
  final String id;
  final MultipartFile? foodImage;
  final String foodName;
  final String foodDescription;
  final String categoryId;
  final int foodCookDuration;
  final List<String> ingredients;
  final List<EditStepModel> editSteps;

  const EditRecipeModel({
    required this.id,
    required this.ingredients,
    required this.editSteps,
    required this.foodName,
    required this.foodDescription,
    required this.foodCookDuration,
    required this.categoryId,
    this.foodImage,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> stepsImagesMap = getStepsImagesMap();

    List<Map<String, dynamic>> steps = getSteps();

    var toUploadJson = {
    //  ApiKeys.recipePicture: foodImage,
      ApiKeys.foodName: foodName,
      ApiKeys.description: foodDescription,
      ApiKeys.cookingDuration: foodCookDuration,
      //    ApiKeys.categoryId: categoryId,
      ApiKeys.ingredients: jsonEncode(ingredients),
      ApiKeys.steps: jsonEncode(steps),
      ...stepsImagesMap
    };
    if(foodImage!=null){
            toUploadJson[ApiKeys.recipePicture] = foodImage;
    }
    return toUploadJson;
  }

  List<Map<String, dynamic>> getSteps() {
    List<Map<String, dynamic>> stepsList = [];
    for (int i = 0; i < editSteps.length; i++) {
      stepsList.add(editSteps[i].toJson(index: i));
    }
    return stepsList;
  }

  Map<String, dynamic> getStepsImagesMap() {
    Map<String, dynamic> stepsImagesMap = {};
    for (int i = 0; i < editSteps.length; i++) {
      var multipartImage = convertToMultipart(editSteps[i].stepImageFile);
      if (multipartImage != null) {
        stepsImagesMap['${ApiKeys.stepImage}_$i'] = multipartImage;
      }
    }
    return stepsImagesMap;
  }

  factory EditRecipeModel.fromEditRecipeFormModel(
          {required EditRecipeFormModel editRecipeFormModel}) =>
      EditRecipeModel(
        id: editRecipeFormModel.id,
        ingredients: editRecipeFormModel.ingredients,
        editSteps: editRecipeFormModel.steps,
        foodName: editRecipeFormModel.foodName,
        foodDescription: editRecipeFormModel.foodDescription,
        foodCookDuration: editRecipeFormModel.foodCookDuration,
        categoryId: editRecipeFormModel.categoryId,
        foodImage: convertToMultipart(
          editRecipeFormModel.foodFileImage,
        ),
      );
}
