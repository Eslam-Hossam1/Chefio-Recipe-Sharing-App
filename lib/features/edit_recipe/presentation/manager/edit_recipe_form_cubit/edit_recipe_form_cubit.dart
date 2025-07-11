import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_step_model.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'edit_recipe_form_state.dart';

class EditRecipeFormCubit extends Cubit<UploadFormState> {
  final EditRecipeRepo _editRecipeRepo;
  final EditRecipeFormModel _editRecipeFormModel;
  List<Category> categories = [];
  EditRecipeFormCubit({
    required EditRecipeRepo editRecipeRepo,
    required EditRecipeFormModel editRecipeFormModel,
  })  : _editRecipeFormModel = editRecipeFormModel,
        _editRecipeRepo = editRecipeRepo,
        super(UploadFormInitial());

  void addIngerdient({
    required GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey,
  }) {
    _editRecipeFormModel.ingredients.add("");
    ingredientsAnimatedListKey.currentState!
        .insertItem(_editRecipeFormModel.ingredients.length - 1);
  }

  void addStep({
    required GlobalKey<SliverAnimatedListState> stepsAnimatedListKey,
  }) {
    _editRecipeFormModel.steps.add(
      EditStepModel(
        stepText: '',
      ),
    );
    stepsAnimatedListKey.currentState!
        .insertItem(_editRecipeFormModel.steps.length - 1);
  }

  void removeIngredient({required int index}) =>
      _editRecipeFormModel.ingredients.removeAt(index);
  void removeStep({required int index}) {
    _editRecipeFormModel.steps.removeAt(index);
  }

  void setStepImage({required int stepIndex, required File stepImageFile}) {
    _editRecipeFormModel.steps[stepIndex].stepImageFile = stepImageFile;
  }

  void removeStepImage({required int index}) {
    _editRecipeFormModel.steps[index].stepImageFile = null;
  }

  void fetchCategories() async {
    categories = _editRecipeRepo.fetchCategories();
    emit(
      CategoriesLoaded(),
    );
  }

}
