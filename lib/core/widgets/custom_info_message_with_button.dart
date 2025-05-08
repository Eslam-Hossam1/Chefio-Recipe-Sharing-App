import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInfoMessageWithButton extends StatelessWidget {
  const CustomInfoMessageWithButton({
    super.key,
    required this.message,
    required this.btnText,
    required this.onPressed,
  });
  final String message;
  final String btnText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            message,
            style: Styles.textStyleMedium17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextButton(
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                btnText,
                style: Styles.textStyleSemiBold15(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
