import 'dart:io';

import 'package:chefio_app/features/upload_recipe/data/models/upload_step_model.dart';

class UploadRecipeFormModel {
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
}
