import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key,
      required this.isSelected,
      required this.categoryName,
      this.onPressed});
  final bool isSelected;
  final String categoryName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      height: 45,
      onPressed: onPressed,
      backgroundColor: isSelected ? context.primaryColor : context.formColor,
      child: Text(
        categoryName,
        style: Styles.textStyleBold15(context).copyWith(
          color: isSelected ? Colors.white : context.secondaryTextColor,
        ),
      ),
    );
  }
}
