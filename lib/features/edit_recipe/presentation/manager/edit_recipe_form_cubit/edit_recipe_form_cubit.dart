import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/core/services/categories_service.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_step_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'edit_recipe_form_state.dart';

class EditRecipeFormCubit extends Cubit<EditRecipeFormState> {
  final EditRecipeFormModel editRecipeFormModel;

  final List<Category> categories;
  EditRecipeFormCubit({
    required this.editRecipeFormModel,
    required CategoriesService categoriesService,
  })  : categories = categoriesService.categories,
        super(CategoriesLoaded()) {
    _moveRecipeCategoryToTheFirstIndex();
  }

  void _moveRecipeCategoryToTheFirstIndex() {
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].id == editRecipeFormModel.categoryId) {
        Category temp = categories[i];
        categories[i] = categories[0];
        categories[0] = temp;
        break;
      }
    }
  }

  void addIngerdient({
    required GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey,
  }) {
    editRecipeFormModel.ingredients.add("");
    ingredientsAnimatedListKey.currentState!
        .insertItem(editRecipeFormModel.ingredients.length - 1);
  }

  void addStep({
    required GlobalKey<SliverAnimatedListState> stepsAnimatedListKey,
  }) {
    editRecipeFormModel.steps.add(
      EditStepModel(
        stepText: '',
      ),
    );
    stepsAnimatedListKey.currentState!
        .insertItem(editRecipeFormModel.steps.length - 1);
  }

  void removeIngredient({required int index}) =>
      editRecipeFormModel.ingredients.removeAt(index);
  void removeStep({required int index}) {
    editRecipeFormModel.steps.removeAt(index);
  }

  void setStepImage({required int stepIndex, required File stepImageFile}) {
    editRecipeFormModel.steps[stepIndex].stepImageFile = stepImageFile;
  }

  void removeStepImage({required int index}) {
    editRecipeFormModel.steps[index].stepImageFile = null;
  }
}
