import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/profile/data/models/profile_info_model/profile_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_info_model/profile_user_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_liked_recipe_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<ApiFailure, ProfileModel>> fetchProfileWithInitialChefRecipes({
    required String chefId,
    required int page,
    required int limit,
  });

  Future<Either<ApiFailure, ProfileUserRecipeModel>> fetchChefRecipes({
    required String chefId,
    required int page,
    required int limit,
  });

  Future<Either<ApiFailure, ProfileLikedRecipeModel>> fetchChefLikedRecipes({
    required String chefId,
    required int page,
    required int limit,
  });
}
