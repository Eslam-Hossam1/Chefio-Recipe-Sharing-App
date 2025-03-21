import 'package:equatable/equatable.dart';

import '../../../../../core/models/category.dart';
import 'created_by.dart';

class Recipe extends Equatable {
  final String? id;
  final String? foodName;
  final String? recipePicture;
  final int? cookingDuration;
  final Category? category;
  final CreatedBy? createdBy;
  final dynamic likes;
  final DateTime? createdAt;

  const Recipe({
    this.id,
    this.foodName,
    this.recipePicture,
    this.cookingDuration,
    this.category,
    this.createdBy,
    this.likes,
    this.createdAt,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json['_id'] as String?,
        foodName: json['foodName'] as String?,
        recipePicture: json['recipePicture'] as String?,
        cookingDuration: json['cookingDuration'] as int?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        createdBy: json['createdBy'] == null
            ? null
            : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
        likes: json['likes'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'foodName': foodName,
        'recipePicture': recipePicture,
        'cookingDuration': cookingDuration,
        'category': category?.toJson(),
        'createdBy': createdBy?.toJson(),
        'likes': likes,
        'createdAt': createdAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      foodName,
      recipePicture,
      cookingDuration,
      category,
      createdBy,
      likes,
      createdAt,
    ];
  }
}
