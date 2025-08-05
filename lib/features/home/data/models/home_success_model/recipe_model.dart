import 'package:chefio_app/core/Entities/recipe_entity.dart';

import '../../../../../core/models/category.dart';
import 'created_by.dart';

class RecipeModel extends RecipeEntity {
  final String id;
  final String foodName;
  bool isLiked;
  final String recipePicture;
  final int cookingDuration;
  final Category category;
  final CreatedBy createdBy;
  final dynamic likes;
  final DateTime? createdAt;

  RecipeModel({
    required this.id,
    required this.foodName,
    required this.isLiked,
    required this.recipePicture,
    required this.cookingDuration,
    required this.category,
    required this.createdBy,
    this.likes,
    this.createdAt,
  }) : super(
          recipeId: id,
          chefId: createdBy.id,
          chefUsername: createdBy.username,
          recipeCategory: category,
          recipeCookingDuration: cookingDuration,
          recipeImageUrl: recipePicture,
          recipeIsLiked: isLiked,
          recipeName: foodName,
          chefImageUrl: createdBy.profilePicture,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json['_id'] as String,
        foodName: json['foodName'] as String,
        isLiked: json['isLiked'] as bool,
        recipePicture: json['recipePicture'] as String,
        cookingDuration: json['cookingDuration'] as int,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        createdBy:
            CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
        likes: json['likes'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'foodName': foodName,
        'recipePicture': recipePicture,
        'isLiked': isLiked,
        'cookingDuration': cookingDuration,
        'category': category.toJson(),
        'createdBy': createdBy.toJson(),
        'likes': likes,
        'createdAt': createdAt?.toIso8601String(),
      };
}
