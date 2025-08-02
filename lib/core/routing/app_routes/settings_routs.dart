// file: lib/core/utils/routing/settings_routes.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:chefio_app/features/settings/presentation/views/language_selection_view.dart';
import 'package:chefio_app/features/settings/presentation/views/theme_selection_view.dart';
import 'package:chefio_app/features/settings/presentation/views/settings_view.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';

class SettingsRoutes {
  static GoRoute settings = GoRoute(
    path: RoutePaths.settings,
    builder: (context, state) {
      return BlocProvider(
        create: (context) => SettingsCubit(
          authCredentialsHelper: getIt<AuthCredentialsHelper>(),
          authRepo: getIt<AuthRepoImpl>(),
        ),
        child: const SettingsView(),
      );
    },
  );

  static GoRoute themeSelection = GoRoute(
    path: RoutePaths.themeSelection,
    builder: (context, state) => const ThemeSelectionView(),
  );

  static GoRoute languageSelection = GoRoute(
    path: RoutePaths.languageSelection,
    builder: (context, state) => const LanguageSelectionView(),
  );

  static List<GoRoute> routes = [
    settings,
    themeSelection,
    languageSelection,
  ];
}
