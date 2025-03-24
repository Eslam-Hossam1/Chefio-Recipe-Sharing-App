import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key, this.isFromDeepLink = false});
  final bool isFromDeepLink;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (isFromDeepLink) {
          context.go(RoutePaths.home);
        } else {
          context.pop();
        }
      },
      child: Scaffold(
       
        body: RecipeDetailsViewBody(),
      ),
    );
  }
}
