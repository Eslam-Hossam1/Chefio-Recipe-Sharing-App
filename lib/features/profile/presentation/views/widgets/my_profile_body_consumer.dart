import 'dart:developer';

import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_info_message_with_button.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/chef_profile_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/my_profile_cubit/my_profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/my_profile_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileViewBodyConsumer extends StatelessWidget {
  const MyProfileViewBodyConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProfileCubit, MyProfileState>(
      listener: (context, state) {
        if (state is MyProfileSuccess) {
          ProfileModel profileModel =
              context.read<MyProfileCubit>().profileModel!;
          List<ChefProfileRecipeModel> chefInitialRecipes =
              profileModel.profile.recipes.recipes;

          context.read<ChefProfileRecipesCubit>().startWithInitialRecipes(
                chefInitialRecipes: chefInitialRecipes,
                limit: chefInitialRecipes.length,
                chefId: profileModel.id,
              );
          log('from consumer   chefId:${profileModel.id} , _authCredentialsHelper.userId:${getIt<AuthCredentialsHelper>().userId}');
        }
      },
      builder: (context, state) {
        if (state is MyProfileSuccess) {
          return MyProfileViewBody(
            profileModel: context.read<MyProfileCubit>().profileModel!,
          );
        } else if (state is MyProfileFailure) {
          return AdaptivePadding(
            child: CustomInfoMessageWithButton(
              message: state.errLocalizationError.tr(),
              onPressed: context.read<MyProfileCubit>().refresh,
            ),
          );
        } else {
          return Center(child: CustomCircularProgressIndicator());
        }
      },
    );
  }
}
