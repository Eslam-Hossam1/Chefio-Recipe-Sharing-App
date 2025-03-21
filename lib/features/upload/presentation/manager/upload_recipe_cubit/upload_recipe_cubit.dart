import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'upload_recipe_state.dart';

class UploadRecipeCubit extends Cubit<UploadRecipeState> {
  List<String> ingredients = [""];
  List<String> steps = [""];
  String foodName = '';
  String foodDescription = '';
  int foodCookDuration = 0;
  String? categoryName;
  late Uint8List foodImage;
  List<Category> categories=[];
  UploadRecipeCubit() : super(UploadRecipeInitial());
  void addIngerdient(
      {required GlobalKey<SliverAnimatedListState>
          ingredientsAnimatedListKey}) {
    ingredients.add("");
    ingredientsAnimatedListKey.currentState!.insertItem(ingredients.length - 1);
  }

  void addStep(
      {required GlobalKey<SliverAnimatedListState> stepsAnimatedListKey}) {
    steps.add("");
    stepsAnimatedListKey.currentState!.insertItem(steps.length - 1);
  }

  void removeIngredient(
      {required GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey,
      required int index}) {
    ingredientsAnimatedListKey.currentState!.removeItem(index,
        (context, animation) {
      return SizedBox(width: 0, height: 0);
    });
    ingredients.removeAt(index);
  }

  void removeStep(
      {required GlobalKey<SliverAnimatedListState> stepsAnimatedListKey,
      required int index}) {
    stepsAnimatedListKey.currentState!.removeItem(index, (context, animation) {
      return SizedBox(width: 0, height: 0);
    });
    steps.removeAt(index);
  }

  // void removeItem(int index) {
  //   animatedListKey.currentState!.removeItem(index, (context, animation) {
  //     return SizedBox(width: 0, height: 0);
  //   });
  //   items.removeAt(index);
  // }
}
