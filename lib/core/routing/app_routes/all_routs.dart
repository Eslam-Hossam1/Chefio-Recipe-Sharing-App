// file: lib/core/utils/routing/all_routes.dart

import 'package:chefio_app/core/routing/app_routes/auth_routs.dart';
import 'package:chefio_app/core/routing/app_routes/onboarding_routs.dart';
import 'package:chefio_app/core/routing/app_routes/profile_routs.dart';
import 'package:chefio_app/core/routing/app_routes/recipe_routs.dart';
import 'package:chefio_app/core/routing/app_routes/settings_routs.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/core/routing/app_routes/shell_branches.dart';
import 'package:chefio_app/core/routing/app_router.dart';
import 'package:chefio_app/features/main/presentation/view/main_view.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return MainScaffoldView(navigationShell: navigationShell);
      },
      branches: ShellBranches.branches,
    ),
    ...OnboardingRoutes.routes,
    ...AuthRoutes.routes,
    ...RecipeRoutes.routes,
    ...ProfileRoutes.routes,
    ...SettingsRoutes.routes,
  ];
}
