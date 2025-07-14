// file: lib/core/utils/routing/recipe_routes.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:chefio_app/core/services/categories_service.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo_impl.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/recipe_details_view.dart';
import 'package:chefio_app/features/upload_recipe/data/repos/upload_repo_impl.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/add_cover_photo_cubit.dart/add_cover_photo_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_submit_cubit/upload_submit_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/upload_view.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo_impl.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_cover_photo_cubit.dart/edit_recipe_cover_photo_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_submit_cubit/edit_recipe_submit_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/edit_recipe_view.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/helpers/share_helper.dart';

class RecipeRoutes {
  static GoRoute recipeDetails = GoRoute(
      path: RoutePaths.recipeDetails,
      builder: (context, state) {
        final String recipeId = state.pathParameters['id']!;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RecipeDetailsCubit(
                getIt<RecipeDetailsRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => RecipeDetailsActionsCubit(
                authCredentialsHelper: getIt<AuthCredentialsHelper>(),
                shareHelper: getIt<ShareHelper>(),
              ),
            ),
          ],
          child: RecipeDetailsView(
            id: recipeId,
          ),
        );
      });
  static GoRoute upload = GoRoute(
    path: RoutePaths.uploadRecipe,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadFormCubit(
            getIt<UploadRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => UploadSubmitCubit(
            uploadRepo: getIt<UploadRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              AddCoverPhotoCubit(getIt<CroppedImagePickerHelper>()),
        ),
      ],
      child: UploadView(),
    ),
  );

  static GoRoute editRecipe = GoRoute(
      path: RoutePaths.editRecipe,
      builder: (context, state) {
        EditRecipeFormModel editRecipeFormModel =
            EditRecipeFormModel.fromRecipeDetailsModel(
          recipeDetailsModel: state.extra as RecipeDetailsModel,
        );
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => EditRecipeFormCubit(
                categoriesService: getIt<CategoriesService>(),
                editRecipeFormModel: editRecipeFormModel,
              ),
            ),
            BlocProvider(
              create: (context) => EditRecipeSubmitCubit(
                editRecipeRepo: getIt<EditRecipeRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => EditRecipeCoverPhotoCubit(
                croppedImagePickerHelper: getIt<CroppedImagePickerHelper>(),
                imageUrl: editRecipeFormModel.foodUrlImage,
              ),
            ),
          ],
          child: EditView(),
        );
      });

  static List<GoRoute> routes = [
    recipeDetails,
    upload,
    editRecipe,
  ];
}
