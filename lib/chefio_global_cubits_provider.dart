import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/core/cubit/like_recipe_cubit/like_recipe_cubit.dart';
import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/services/follow_chef_service.dart';
import 'package:chefio_app/core/services/like_recipe_service.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/features/home/data/repos/home_repo_impl.dart';
import 'package:chefio_app/features/home/presentation/manager/home_recipes_cubit/home_recipes_cubit.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_connections_cubit/chef_connections_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/my_profile_cubit/my_profile_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefioGlobalCubitsProvider extends StatelessWidget {
  /// These cubits are used across the app and should be provided globally
  const ChefioGlobalCubitsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
            create: (_) => LikeRecipeCubit(getIt<LikeRecipeService>())),
        BlocProvider(
          create: (_) =>
              ChefConnectionsCubit(profileRepo: getIt<ProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (_) =>
              FollowChefCubit(followChefService: getIt<FollowChefService>()),
        ),
        BlocProvider(create: (_) => HomeRecipesCubit(getIt<HomeRepoImpl>())),
        BlocProvider(
          create: (_) => MyProfileCubit(
            profileRepo: getIt<ProfileRepoImpl>(),
            authCredentialsHelper: getIt<AuthCredentialsHelper>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
