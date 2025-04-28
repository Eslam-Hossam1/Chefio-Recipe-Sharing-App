import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

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
              "klajklfjdakljfklasjfjadjfaklfkasjdklfjklasjfkljskldjfklj",
              style: Styles.textStyleMedium17(context)
                  .copyWith(color: context.mainTextColor),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              textAlign: TextAlign.center,
              "klajklfjdakljfklasjfjadjfaklfkasjdklfjklasjfkljskldjfklj",
              style: Styles.textStyleMedium15(context)
                  .copyWith(color: context.mainTextColor),
            ),
            SizedBox(
              height: 24,
            ),
            CustomTextButton(
              child: Text(
                "go to home",
                style: Styles.textStyleMedium15(context)
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
