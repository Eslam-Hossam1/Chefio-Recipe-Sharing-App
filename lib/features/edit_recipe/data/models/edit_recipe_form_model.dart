import 'dart:io';

import 'package:chefio_app/features/edit_recipe/data/models/edit_step_model.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';

class EditRecipeFormModel {
  final String id;
  final List<String> ingredients;
  final List<EditStepModel> steps;
  final String foodName;
  final String foodDescription;
  final int foodCookDuration;
  final String categoryId;
  final File? foodFileImage;
  final String foodUrlImage;

  EditRecipeFormModel({
    required this.id,
    required this.ingredients,
    required this.steps,
    required this.foodName,
    required this.foodDescription,
    required this.foodCookDuration,
    required this.categoryId,
    required this.foodFileImage,
    required this.foodUrlImage,
  });
  factory EditRecipeFormModel.fromRecipeDetailsModel(
          {required RecipeDetailsModel recipeDetailsModel}) =>
      EditRecipeFormModel(
        id: recipeDetailsModel.id,
        ingredients: recipeDetailsModel.ingredients,
        steps: recipeDetailsModel.steps
            .map(
              (stepModel) => EditStepModel(
                stepText: stepModel.step,
                stepUrlImage: stepModel.stepImage,
              ),
            )
            .toList(),
        foodName: recipeDetailsModel.foodName,
        foodDescription: recipeDetailsModel.description,
        foodCookDuration: recipeDetailsModel.cookingDuration,
        categoryId: recipeDetailsModel.category.id,
        foodFileImage: null,
        foodUrlImage: recipeDetailsModel.recipePicture,
      );
}
