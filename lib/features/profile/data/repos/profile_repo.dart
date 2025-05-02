import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/profile/data/models/chef_follower_model.dart';
import 'package:chefio_app/features/profile/data/models/chef_following_model.dart';

import 'package:chefio_app/features/profile/data/models/profile_chef_liked_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_chef_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<ApiFailure, ProfileModel>> fetchProfileWithInitialChefRecipes({
    required String chefId,
    required int page,
    required int limit,
  });

  Future<Either<ApiFailure, List<ProfileChefRecipeModel>>> fetchChefRecipes({
    required String chefId,
    required int page,
    required int limit,
  });

  Future<Either<ApiFailure, List<ProfileChefLikedRecipeModel>>>
      fetchChefLikedRecipes({
    required String chefId,
    required int page,
    required int limit,
  });
  Future<Either<ApiFailure, List<ChefFollowingModel>>>
      fetchChefFollowings({
    required String chefId,
  });
  Future<Either<ApiFailure, List<ChefFollowerModel>>>
      fetchChefFollowers({
    required String chefId,
  });
}
