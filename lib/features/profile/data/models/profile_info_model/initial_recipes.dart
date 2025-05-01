import 'package:equatable/equatable.dart';

import 'profile_user_recipe_model.dart';

class InitialRecipes extends Equatable {
  final int? totalRecipes;
  final int? currentPage;
  final int? totalPages;
  final List<ProfileUserRecipeModel>? recipes;

  const InitialRecipes({
    this.totalRecipes,
    this.currentPage,
    this.totalPages,
    this.recipes,
  });

  factory InitialRecipes.fromJson(Map<String, dynamic> json) => InitialRecipes(
        totalRecipes: json['totalRecipes'] as int?,
        currentPage: json['currentPage'] as int?,
        totalPages: json['totalPages'] as int?,
        recipes: (json['recipes'] as List<dynamic>?)
            ?.map((e) =>
                ProfileUserRecipeModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'totalRecipes': totalRecipes,
        'currentPage': currentPage,
        'totalPages': totalPages,
        'recipes': recipes?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      totalRecipes,
      currentPage,
      totalPages,
      recipes,
    ];
  }
}
