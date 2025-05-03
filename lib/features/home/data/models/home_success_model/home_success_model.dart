import 'package:equatable/equatable.dart';

import 'recipe_model.dart';

class HomeSuccessModel extends Equatable {
  final bool? success;
  final int? totalRecipes;
  final int? currentPage;
  final int? totalPages;
  final List<RecipeModel>? recipes;

  const HomeSuccessModel({
    this.success,
    this.totalRecipes,
    this.currentPage,
    this.totalPages,
    this.recipes,
  });

  factory HomeSuccessModel.fromJson(Map<String, dynamic> json) {
    return HomeSuccessModel(
      success: json['success'] as bool?,
      totalRecipes: json['totalRecipes'] as int?,
      currentPage: json['currentPage'] as int?,
      totalPages: json['totalPages'] as int?,
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'totalRecipes': totalRecipes,
        'currentPage': currentPage,
        'totalPages': totalPages,
        'recipes': recipes?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      success,
      totalRecipes,
      currentPage,
      totalPages,
      recipes,
    ];
  }
}
