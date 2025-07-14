// file: lib/core/utils/routing/profile_routes.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/profile/presentation/views/profile_view.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_liked_recipes_cubit/chef_liked_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_follow_button_cubit/profile_follow_button_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:chefio_app/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:chefio_app/features/edit_profile/data/repos/edit_profile_repo_impl.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';

class ProfileRoutes {
  static GoRoute profile = GoRoute(
      path: RoutePaths.profile,
      builder: (context, state) {
        final String chefId = state.pathParameters['id']!;

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ChefProfileRecipesCubit(
                profileRepo: getIt<ProfileRepoImpl>(),
                authCredentialsHelper: getIt<AuthCredentialsHelper>(),
              ),
            ),
            BlocProvider(
              create: (context) => ChefLikedRecipesCubit(
                profileRepo: getIt<ProfileRepoImpl>(),
                authCredentialsHelper: getIt<AuthCredentialsHelper>(),
              ),
            ),
            BlocProvider(
              create: (context) => ProfileFollowButtonCubit(
                authCreadentialsHelper: getIt<AuthCredentialsHelper>(),
              ),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(
                profileRepo: getIt<ProfileRepoImpl>(),
              ),
            ),
          ],
          child: ProfileView(
            chefId: chefId,
          ),
        );
      });

  static GoRoute editProfile = GoRoute(
    path: RoutePaths.editProfile,
    builder: (context, state) {
      final ProfileModel profileModel = state.extra as ProfileModel;
      return BlocProvider(
        create: (context) => EditProfileCubit(
          croppedImagePickerHelper: getIt<CroppedImagePickerHelper>(),
          editProfileRepo: getIt<EditProfileRepoImpl>(),
        ),
        child: EditProfileView(
          profileModel: profileModel,
        ),
      );
    },
  );

  static List<GoRoute> routes = [
    profile,
    editProfile,
  ];
}
