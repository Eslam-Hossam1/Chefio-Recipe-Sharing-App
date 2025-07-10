import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/upload/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_step_model.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'upload_form_state.dart';

class UploadFormCubit extends Cubit<UploadFormState> {
  final UploadRepo _uploadRepo;
  String? id;
  List<String> ingredients = ["", ""];
  List<UploadStepModel> steps = [
    UploadStepModel(stepText: ''),
    UploadStepModel(stepText: ''),
  ];
  String foodName = '';
  String foodDescription = '';
  int foodCookDuration = 1;
  String categoryId = '';
  File? foodImage;
  List<Category> categories = [];
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
    steps.add(
      UploadStepModel(
        stepText: '',
      ),
    );
    stepsAnimatedListKey.currentState!.insertItem(steps.length - 1);
  }

  void removeIngredient({required int index}) => ingredients.removeAt(index);
  void removeStep({required int index}) {
    steps.removeAt(index);
  }

  void setStepImage({required int stepIndex, required File stepImageFile}) {
    steps[stepIndex].stepImageFile = stepImageFile;
  }

  void removeStepImage({required int index}) {
    steps[index].stepImageFile = null;
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
      categories = returnedCategories;
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
      uploadSteps: steps,
      foodName: foodName,
      foodDescription: foodDescription,
      foodCookDuration: foodCookDuration,
      categoryId: categoryId,
      foodImage: convertToMultipart(foodImage)!,
    );
  }
}
