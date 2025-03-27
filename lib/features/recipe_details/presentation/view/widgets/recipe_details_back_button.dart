
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
      onPressed:() {
    final uri = GoRouter.of(context).routeInformationProvider.value.uri.toString();
    final isFromDeepLink = uri.contains(RoutePaths.recipeDetailsDeep); // هنا بنشوف لو الصفحة جت من ديب لينك

    final navigator = Navigator.of(context);
    navigator.maybePop().then((didPop) {
      if (!didPop) {
        if(context.mounted){
          if (isFromDeepLink) {
          context.go('${RoutePaths.home}/${RoutePaths.search}');
        } else {
          context.pop();
        }
        }
        
      }
    });
  

      },
      child: SvgPicture.asset(
        Assets.imagesIosBackOutline,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
