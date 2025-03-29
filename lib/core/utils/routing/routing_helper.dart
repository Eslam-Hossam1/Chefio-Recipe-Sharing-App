import 'package:chefio_app/core/utils/routing/routs.dart';

abstract class RoutingHelper {
  static String getRecipeDetailsPath({required String recipeId}) {
    return '${RoutePaths.recipeDetailsWithoutId}/$recipeId';
  }

  static const String getSearchNestedRoutePath =
      '${RoutePaths.home}/${RoutePaths.search}';
}
