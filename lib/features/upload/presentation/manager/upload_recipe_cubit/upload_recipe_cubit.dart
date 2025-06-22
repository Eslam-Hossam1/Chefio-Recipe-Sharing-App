import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/upload/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'upload_recipe_state.dart';

class UploadRecipeCubit extends Cubit<UploadRecipeState> {
  final UploadRepo _uploadRepo;
  bool isEdit = false;
  String? id;
  List<String> ingredients = ["",""];
  List<String> steps = ["",""];
  String foodName = '';
  String foodDescription = '';
  int foodCookDuration = 1;
  String categoryId = '';
  File? foodImage;
  List<Category> categories = [];

  UploadRecipeCubit(
    this._uploadRepo,
  ) : super(UploadRecipeInitial());

  void addIngerdient({
    required GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey,
  }) {
    ingredients.add("");
    ingredientsAnimatedListKey.currentState!.insertItem(ingredients.length - 1);
  }

  void addStep({
    required GlobalKey<SliverAnimatedListState> stepsAnimatedListKey,
  }) {
    steps.add("");
    stepsAnimatedListKey.currentState!.insertItem(steps.length - 1);
  }

  void removeIngredient({
    required GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey,
    required int index,
  }) {
        ingredients.removeAt(index);

    ingredientsAnimatedListKey.currentState!.removeItem(index,
        (context, animation) {
      return SizedBox(width: 0, height: 0);
    });
  }

  void removeStep({
    required GlobalKey<SliverAnimatedListState> stepsAnimatedListKey,
    required int index,
  }) {
        steps.removeAt(index);

    stepsAnimatedListKey.currentState!.removeItem(index, (context, animation) {
      return SizedBox(width: 0, height: 0);
    });
  }

  void checkAndInitForEditing(
      {required RecipeDetailsModel? recipeDetailModel}) {
    if (recipeDetailModel == null) return;
    foodName = recipeDetailModel.foodName;
    log(foodName);

    foodDescription = recipeDetailModel.description;
    foodCookDuration = recipeDetailModel.cookingDuration;
    categoryId = recipeDetailModel.category.id!;
    log(foodName);

    ingredients = recipeDetailModel.ingredients;
    steps = recipeDetailModel.steps;
    isEdit = true;
    id = recipeDetailModel.id;
  }

  Future<void> fetchCategories() async {
    emit(LoadingCategories());
    var result = await _uploadRepo.fetchCategories();
    result.fold((failure) {
      emit(
        CategoriesFailed(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      );
    }, (returnedCategories) {
      this.categories = returnedCategories;
      if (!isEdit) {
        categoryId = categories[0].id;
      } else {
        for (int i = 0; i < categories.length; i++) {
          if (categories[i].id == categoryId) {
            Category temp = categories[i];
            categories[i] = categories[0];
            categories[0] = temp;
            break;
          }
        }
      }
      emit(
        CategoriesLoaded(),
      );
    });
  }

  bool validateImage() {
    if (isEdit == false && foodImage == null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> setRecipe() async {
    if (isEdit) {
      await editRecipe();
    } else {
      await uploadRecipe();
    }
  }

  Future<void> editRecipe() async {
    emit(UploadRecipeLoading());

    EditRecipeModel editRecipeModel = _getEditRecipeModel();
    //place edit request here

    var result = await _uploadRepo.editRecipe(editRecipeModel: editRecipeModel);
    result.fold((failure) {
      emit(
        UploadRecipeFailed(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey),
      );
    }, (_) {
      emit(UploadRecipeSuccess());
    });
  }

  Future<void> uploadRecipe() async {
    emit(UploadRecipeLoading());
    UploadRecipeModel uploadRecipeModel = _getUploadRecipeModel();
    var result =
        await _uploadRepo.uploadRecipe(uploadRecipeModel: uploadRecipeModel);
    result.fold((failure) {
      emit(
        UploadRecipeFailed(
            errorMessage: failure.errMsg,
            errorLocalizationKey: failure.localizaitonKey),
      );
    }, (_) {
      emit(UploadRecipeSuccess());
    });
  }

  UploadRecipeModel _getUploadRecipeModel() {
    return UploadRecipeModel(
      ingredients: ingredients,
      steps: steps,
      foodName: foodName,
      foodDescription: foodDescription,
      foodCookDuration: foodCookDuration,
      categoryId: categoryId,
      foodImage: convertToMultipart(foodImage)!,
    );
  }

  EditRecipeModel _getEditRecipeModel() {
    return EditRecipeModel(
      id: id!,
      ingredients: ingredients,
      steps: steps,
      foodName: foodName,
      foodDescription: foodDescription,
      foodCookDuration: foodCookDuration,
      categoryId: categoryId,
      foodImage: convertToMultipart(foodImage),
    );
  }
}
