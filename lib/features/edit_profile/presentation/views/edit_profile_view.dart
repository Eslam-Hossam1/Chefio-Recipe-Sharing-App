import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:chefio_app/features/edit_profile/presentation/views/widgets/edit_profile_body.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/my_profile_cubit/my_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.profileModel});
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalization.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is EditProfileSuccess) {
          DialogHelper.showSuccessDialog(
              successMessage:
                  AppLocalizationKeys.profile.editProfileSuccessMessage.tr(),
              context, btnOkOnPress: () {
            context.read<MyProfileCubit>().fetchChefProfileWithInitialRecipes();

            context.go(RoutePaths.myProfile);
          }, onDismissCallback: (_) {
            context.read<MyProfileCubit>().fetchChefProfileWithInitialRecipes();

            context.go(RoutePaths.myProfile);
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditProfileLoading,
          child: Scaffold(
            body: EditProfileBody(
              profileModel: profileModel,
            ),
          ),
        );
      },
    ));
  }
}
