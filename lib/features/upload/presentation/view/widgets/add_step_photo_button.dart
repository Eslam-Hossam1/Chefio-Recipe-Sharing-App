
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddStepPhotoButton extends StatelessWidget {
  const AddStepPhotoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: context.formColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        child: SvgPicture.asset(
          Assets.imagesCamera,
          colorFilter: ColorFilter.mode(
            context.mainTextColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
