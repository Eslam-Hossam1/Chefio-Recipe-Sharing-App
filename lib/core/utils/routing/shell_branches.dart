import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/home/data/repos/home_repo_impl.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/features/home/presentation/view/home_view.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/recipe_details_view_test.dart';
import 'package:chefio_app/features/upload/presentation/view/upload_view.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/notifications_view_test.dart';
import 'package:chefio_app/features/profile/presentation/view/profile_view_test.dart';

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
          builder: (context, state) => BlocProvider(
            create: (context) => HomeCubit(getIt<HomeRepoImpl>()),
            child: const HomeView(),
          ),
          routes: [
            GoRoute(
              path: RoutePaths.recipeDetails,
              builder: (context, state) => const RecipeDetailsPage(),
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
          path: RoutePaths.profile,
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    );
  }
}
