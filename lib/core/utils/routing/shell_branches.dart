import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/home/data/repos/home_repo_impl.dart';
import 'package:chefio_app/features/home/presentation/manager/home_categories_cubit/home_categories_cubit.dart';
import 'package:chefio_app/features/home/presentation/manager/home_recipes_cubit/home_recipes_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/home_view.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/notifications_view_test.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/my_profile_view.dart';
import 'package:chefio_app/features/search/data/repos/search_recipe_rebo_impl.dart';
import 'package:chefio_app/features/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:chefio_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class ShellBranches {
  // Define navigator keys
  static final _homeKey = GlobalKey<NavigatorState>();
  // static final _uploadKey = GlobalKey<NavigatorState>();
  static final _notificationKey = GlobalKey<NavigatorState>();
  static final _profileKey = GlobalKey<NavigatorState>();

  // Method to return the list of StatefulShellBranch
  static List<StatefulShellBranch> get branches => [
        _homeBranch(),
        // _uploadBranch(),
        _notificationBranch(),
        _profileBranch(),
      ];

  // Private methods for each branch
  static StatefulShellBranch _homeBranch() {
    return StatefulShellBranch(
      navigatorKey: _homeKey,
      routes: [
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeRecipesCubit(getIt<HomeRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => HomeCategoriesCubit(getIt<HomeRepoImpl>()),
              ),
            ],
            child: const HomeView(),
          ),
          routes: [
            GoRoute(
              path: RoutePaths.search,
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    SearchRecipeCubit(getIt<SearchRecipeRepoImpl>()),
                child: const SearchView(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // static StatefulShellBranch _uploadBranch() {
  //   return StatefulShellBranch(
  //     navigatorKey: _uploadKey,
  //     routes: [
  //       GoRoute(
  //         path: RoutePaths.upload,
  //         builder: (context, state) => const UploadView(),
  //       ),
  //     ],
  //   );
  // }

  static StatefulShellBranch _notificationBranch() {
    return StatefulShellBranch(
      navigatorKey: _notificationKey,
      routes: [
        GoRoute(
          path: RoutePaths.notifications,
          builder: (context, state) => const NotificationPage(),
        ),
      ],
    );
  }

  static StatefulShellBranch _profileBranch() {
    return StatefulShellBranch(
      navigatorKey: _profileKey,
      routes: [
        GoRoute(
          path: RoutePaths.myProfile,
          builder: (context, state) => BlocProvider(
            create: (context) => ProfileCubit(
              profileRepo: getIt<ProfileRepoImpl>(),
            ),
            child: const MyProfileView(),
          ),
        ),
      ],
    );
  }
}
