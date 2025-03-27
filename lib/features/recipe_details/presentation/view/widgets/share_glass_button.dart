
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShareGlassButton extends StatelessWidget {
  const ShareGlassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCircleGlassButton(
      child: SvgPicture.asset(
        Assets.imagesShare,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}