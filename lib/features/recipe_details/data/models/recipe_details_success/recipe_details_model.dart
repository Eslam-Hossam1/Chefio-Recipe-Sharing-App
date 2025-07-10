import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_step.dart';
import 'package:equatable/equatable.dart';

import 'created_by.dart';

class RecipeDetailsModel extends Equatable {
  final int likesCount;
  final bool? isLiked;
  final String id;
  final CreatedBy createdBy;
  final String recipePicture;
  final String foodName;
  final String description;
  final int cookingDuration;
  final List<String> ingredients;
  final List<RecipeDetailsStep> steps;
  final Category category;
  final int? v;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RecipeDetailsModel({
    required this.likesCount,
    this.isLiked,
    required this.id,
    required this.createdBy,
    required this.recipePicture,
    required this.foodName,
    required this.description,
    required this.cookingDuration,
    required this.ingredients,
    required this.steps,
    required this.category,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json) =>
      RecipeDetailsModel(
        likesCount: json['likesCount'] as int,
        isLiked: json['isLiked'] as bool?,
        id: json['_id'] as String,
        createdBy:
            CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
        recipePicture: json['recipePicture'] as String,
        foodName: json['foodName'] as String,
        description: json['description'] as String,
        cookingDuration: json['cookingDuration'] as int,
        ingredients: (json['ingredients'] as List<dynamic>).cast<String>(),
        steps: (json['steps'] as List<dynamic>)
            .map((e) => RecipeDetailsStep.fromJson(e as Map<String, dynamic>))
            .toList(),
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        v: json['__v'] as int?,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'likesConut': likesCount,
        'isLiked': isLiked,
        '_id': id,
        'createdBy': createdBy.toJson(),
        'recipePicture': recipePicture,
        'foodName': foodName,
        'description': description,
        'cookingDuration': cookingDuration,
        'ingredients': ingredients,
        'steps': steps.map((e) => e.toJson()).toList(),
        'category': category.toJson(),
        '__v': v,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      likesCount,
      isLiked,
      id,
      createdBy,
      recipePicture,
      foodName,
      description,
      cookingDuration,
      ingredients,
      steps,
      category,
      v,
      createdAt,
      updatedAt,
    ];
  }
}
