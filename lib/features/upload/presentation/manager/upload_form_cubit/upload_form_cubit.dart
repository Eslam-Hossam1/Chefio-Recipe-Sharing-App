import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/upload/data/models/my_step_image_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'upload_form_state.dart';

class UploadFormCubit extends Cubit<UploadFormState> {
  final UploadRepo _uploadRepo;
  String? id;
  List<String> ingredients = ["", ""];
  List<String> steps = ["", ""];
  String foodName = '';
  String foodDescription = '';
  int foodCookDuration = 1;
  String categoryId = '';
  File? foodImage;
  List<Category> categories = [];
  List<MyStepImageModel> stepsImageModels = [];
  UploadFormCubit(
    this._uploadRepo,
  ) : super(UploadFormInitial());

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

  void removeIngredient({required int index}) => ingredients.removeAt(index);
  void removeStep({required int index}) {
    steps.removeAt(index);
    int imageStepIndex =
        stepsImageModels.indexWhere((element) => element.stepIndex == index);
    stepsImageModels.removeAt(imageStepIndex);
    for (var element in stepsImageModels) {
      if (element.stepIndex > imageStepIndex) {
        element.stepIndex--;
      }
    }
  }

  void changeStepImage(MyStepImageModel stepImageModel) {
    for (var stepImage in stepsImageModels) {
      if (stepImage.stepIndex == stepImageModel.stepIndex) {
        stepImage = stepImageModel;
      }
    }
  }

  void removeStepImage({required int index}) {
    stepsImageModels.removeWhere((element) => element.stepIndex == index);
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

      for (int i = 0; i < categories.length; i++) {
        if (categories[i].id == categoryId) {
          Category temp = categories[i];
          categories[i] = categories[0];
          categories[0] = temp;
          break;
        }
      }

      emit(
        CategoriesLoaded(),
      );
    });
  }

  bool validateImage() {
    if (foodImage == null) {
      return true;
    } else {
      return false;
    }
  }

  UploadRecipeModel getUploadRecipeModel() {
    return UploadRecipeModel(
      ingredients: ingredients,
      steps: steps,
      foodName: foodName,
      foodDescription: foodDescription,
      foodCookDuration: foodCookDuration,
      categoryId: categoryId,
      foodImage: convertToMultipart(foodImage)!,
      stepsImageModels: stepsImageModels,
    );
  }
}
