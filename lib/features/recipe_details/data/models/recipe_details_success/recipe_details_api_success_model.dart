import 'package:equatable/equatable.dart';

import 'recipe_details_model.dart';

class RecipeDetailsApiSuccessModel extends Equatable {
  final bool success;
  final RecipeDetailsModel recipeDetailsModel;

  const RecipeDetailsApiSuccessModel(
      {required this.success, required this.recipeDetailsModel});

  factory RecipeDetailsApiSuccessModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailsApiSuccessModel(
      success: json['success'] as bool,
      recipeDetailsModel:
          RecipeDetailsModel.fromJson(json['recipe'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'recipe': recipeDetailsModel.toJson(),
      };

  @override
  List<Object?> get props => [success, recipeDetailsModel];
}
