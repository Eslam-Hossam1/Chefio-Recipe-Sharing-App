import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomBackIconButton extends StatelessWidget {
  const CustomBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(RoutePaths.home);
        }
      },
      icon: SvgPicture.asset(
        Assets.imagesIosBackOutline,
        colorFilter: ColorFilter.mode(
          context.mainTextColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
