import 'package:chefio_app/core/models/category.dart';
import 'package:equatable/equatable.dart';


class ProfileUserRecipeModel extends Equatable {
  final String id;
  final String foodName;
  final String recipePicture;
  final int cookingDuration;
  final Category category;
   bool isLiked;

   ProfileUserRecipeModel({
    required this.id,
    required this.foodName,
    required this.recipePicture,
    required this.cookingDuration,
    required this.category,
    required this.isLiked,
  });

  factory ProfileUserRecipeModel.fromJson(Map<String, dynamic> json) =>
      ProfileUserRecipeModel(
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

  @override
  List<Object?> get props {
    return [
      id,
      foodName,
      recipePicture,
      cookingDuration,
      category,
      isLiked,
    ];
  }
}
