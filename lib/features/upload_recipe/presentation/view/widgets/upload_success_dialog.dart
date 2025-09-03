import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/home/presentation/manager/home_recipes_cubit/home_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/my_profile_cubit/my_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UploadRecipeSuccessDialog extends StatelessWidget {
  const UploadRecipeSuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.dialogBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.imagesPartyImoge,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              textAlign: TextAlign.center,
              AppLocalizationKeys.upload.uploadSuccess.tr(),
              style: Styles.textStyleBold22(context)
                  .copyWith(color: context.mainTextColor),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              textAlign: TextAlign.center,
              AppLocalizationKeys.upload.uploadSuccessMessage.tr(),
              style: Styles.textStyleMedium15(context)
                  .copyWith(color: context.mainTextColor),
            ),
            SizedBox(
              height: 24,
            ),
            CustomTextButton(
              width: double.infinity,
              onPressed: () {
                _refreshHomeAndProfileToSyncChanges(context);
                context.go(RoutePaths.home);
              },
              child: Text(
                AppLocalizationKeys.upload.goToHome.tr(),
                style: Styles.textStyleBold15(context)
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _refreshHomeAndProfileToSyncChanges(BuildContext context) {
    context.read<MyProfileCubit>().refresh();
    context.read<HomeRecipesCubit>().refreshRecipes();
  }
}
