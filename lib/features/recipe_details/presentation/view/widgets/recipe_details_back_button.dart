import 'package:chefio_app/core/utils/Localization/localization_helper.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailsBackButton extends StatelessWidget {
  const RecipeDetailsBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCircleGlassButton(
      onPressed: () {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(RoutePaths.home);
        }
      },
      child: Transform.rotate(
        angle: LocalizationHelper.checkArabicLocale(context) ? 3.14159 : 0,
        child: SvgPicture.asset(
          Assets.imagesIosBackOutline,
          colorFilter: ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
