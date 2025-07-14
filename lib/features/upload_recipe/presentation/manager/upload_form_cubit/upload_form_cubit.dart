import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_recipe_form_model.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_step_model.dart';
import 'package:chefio_app/features/upload_recipe/data/repos/upload_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'upload_form_state.dart';

class UploadFormCubit extends Cubit<UploadFormState> {
  final UploadRepo _uploadRepo;
  final UploadRecipeFormModel uploadRecipeFormModel = UploadRecipeFormModel();

  List<Category> categories = [];
  UploadFormCubit(
    this._uploadRepo,
  ) : super(UploadFormInitial());

  void addIngerdient({
    required GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey,
  }) {
    uploadRecipeFormModel.ingredients.add("");
    ingredientsAnimatedListKey.currentState!.insertItem(uploadRecipeFormModel.ingredients.length - 1);
  }

  void addStep({
    required GlobalKey<SliverAnimatedListState> stepsAnimatedListKey,
  }) {
    uploadRecipeFormModel.steps.add(
      UploadStepModel(
        stepText: '',
      ),
    );
    stepsAnimatedListKey.currentState!.insertItem(uploadRecipeFormModel.steps.length - 1);
  }

  void removeIngredient({required int index}) => uploadRecipeFormModel.ingredients.removeAt(index);
  void removeStep({required int index}) {
    uploadRecipeFormModel.steps.removeAt(index);
  }

  void setStepImage({required int stepIndex, required File stepImageFile}) {
   uploadRecipeFormModel. steps[stepIndex].stepImageFile = stepImageFile;
  }

  void removeStepImage({required int index}) {
   uploadRecipeFormModel. steps[index].stepImageFile = null;
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
    if (uploadRecipeFormModel.foodImage == null) {
      return true;
    } else {
      return false;
    }
  }

  
}
