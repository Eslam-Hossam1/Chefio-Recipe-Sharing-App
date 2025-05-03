import 'package:chefio_app/core/Entities/recipe_body_entity.dart';
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/models/category.dart';

//chef's recipe model whch is used in the profile page
class ChefProfileRecipeModel extends RecipeBodyEntity {
  final String id;
  final String foodName;
  final String recipePicture;
  final int cookingDuration;
  final Category category;
  bool isLiked;

  ChefProfileRecipeModel({
    required this.id,
    required this.foodName,
    required this.recipePicture,
    required this.cookingDuration,
    required this.category,
    required this.isLiked,
  }) : super(
          recipeId: id,
          recipeName: foodName,
          recipeImageUrl: recipePicture,
          recipeCookingDuration: cookingDuration,
          recipeCategory: category,
          recipeIsLiked: isLiked,
        );

  factory ChefProfileRecipeModel.fromJson(Map<String, dynamic> json) =>
      ChefProfileRecipeModel(
        id: json['_id'] as String,
        foodName: json['foodName'] as String,
        recipePicture: json['recipePicture'] as String,
        cookingDuration: json['cookingDuration'] as int,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        isLiked: json['isLiked'] as bool,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'foodName': foodName,
        'recipePicture': recipePicture,
        'cookingDuration': cookingDuration,
        'category': category.toJson(),
        'isLiked': isLiked,
      };
}
