import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/created_by.dart';

// ProfileLikedRecipeModel is used to represent a recipe that a chef has liked in their profile.
class ChefLikedRecipeModel extends RecipeEntity {
  final String id;
  final String foodName;
  final String recipePicture;
  final int cookingDuration;
  final Category category;
  final CreatedBy createdBy;
  bool isLiked;

  ChefLikedRecipeModel({
    required this.id,
    required this.foodName,
    required this.recipePicture,
    required this.cookingDuration,
    required this.category,
    required this.createdBy,
    required this.isLiked,
  }) : super(
          recipeId: id,
          recipeName: foodName,
          recipeImageUrl: recipePicture,
          chefUsername: createdBy.username,
          chefId: createdBy.id,
          chefImageUrl: createdBy.profilePicture,
          recipeCookingDuration: cookingDuration,
          recipeCategory: category,
          recipeIsLiked: isLiked,
        );

  factory ChefLikedRecipeModel.fromJson(Map<String, dynamic> json) =>
      ChefLikedRecipeModel(
        id: json['_id'] as String,
        foodName: json['foodName'] as String,
        recipePicture: json['recipePicture'] as String,
        cookingDuration: json['cookingDuration'] as int,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        isLiked: json['isLiked'] as bool,
        createdBy:
            CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'foodName': foodName,
        'recipePicture': recipePicture,
        'cookingDuration': cookingDuration,
        'category': category.toJson(),
        'isLiked': isLiked,
        'createdBy': createdBy.toJson(),
      };
}
