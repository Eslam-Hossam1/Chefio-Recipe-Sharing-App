import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetRecipeSuccessDialog extends StatelessWidget {
  const SetRecipeSuccessDialog({
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
              "Upload Success",
              style: Styles.textStyleBold22(context)
                  .copyWith(color: context.mainTextColor),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              textAlign: TextAlign.center,
              "Your recipe has been uploaded,\nyou can see it on your profile",
              style: Styles.textStyleMedium15(context)
                  .copyWith(color: context.mainTextColor),
            ),
            SizedBox(
              height: 24,
            ),
            CustomTextButton(
              width: double.infinity,
              onPressed: () {
                context.go(RoutePaths.home);
              },
              child: Text(
                "Back to Home",
                style: Styles.textStyleBold15(context)
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
