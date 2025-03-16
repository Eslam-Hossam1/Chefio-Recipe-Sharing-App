
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddIngredintButton extends StatelessWidget {
  const AddIngredintButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      backgroundColor: Colors.transparent,
      borderSide: BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: context.outlineColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            color: context.mainTextColor,
          ),
          SizedBox(),
          Text(
            AppLocalizationKeys.upload.addIngredient.tr(),
            style: Styles.textStyleMedium15(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
