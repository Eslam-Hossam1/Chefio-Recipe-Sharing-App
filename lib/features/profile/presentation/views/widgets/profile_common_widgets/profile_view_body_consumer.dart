import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_error_message.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/chef_profile_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profil_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBodyConsumer extends StatelessWidget {
  const ProfileViewBodyConsumer({
    super.key,
    required this.onSuccessProfileViewBody,
  });
  final WidgetBuilder onSuccessProfileViewBody;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        ProfileModel profileModel = context.read<ProfileCubit>().profileModel!;
        List<ChefProfileRecipeModel> chefInitialRecipes =
            profileModel.profile.recipes.recipes;
        if (state is ProfileSuccess) {
          context.read<ChefProfileRecipesCubit>().startWithInitialRecipes(
                chefInitialRecipes: chefInitialRecipes,
                limit: chefInitialRecipes.length,
              );
        }
      },
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return onSuccessProfileViewBody(context);
        } else if (state is ProfileFailure) {
          return CustomTextInfoMessage(
            text: state.errLocalizationError.tr(),
          );
        } else {
          return Center(child: CustomCircularProgressIndicator());
        }
      },
    );
  }
}
