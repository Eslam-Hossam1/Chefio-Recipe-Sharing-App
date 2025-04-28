import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: onPressed,
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
            text,
            style: Styles.textStyleMedium15(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
