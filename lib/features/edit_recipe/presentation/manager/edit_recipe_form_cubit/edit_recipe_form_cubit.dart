import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_step_model.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'edit_recipe_form_state.dart';

class EditRecipeFormCubit extends Cubit<EditRecipeFormState> {
  final EditRecipeRepo _editRecipeRepo;
  final EditRecipeFormModel editRecipeFormModel;
  List<Category> categories = [];
  EditRecipeFormCubit({
    required EditRecipeRepo editRecipeRepo,
    required this.editRecipeFormModel,
  })  : _editRecipeRepo = editRecipeRepo,
        super(EditRecipeFormInitial());

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

  void fetchCategories() async {
    categories = _editRecipeRepo.fetchCategories();
    emit(
      CategoriesLoaded(),
    );
  }
}
