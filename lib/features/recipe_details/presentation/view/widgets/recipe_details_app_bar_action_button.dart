
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/edit_and_share_pop_up_menu_buton.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/share_glass_button.dart';
import 'package:flutter/material.dart';

class RecipeDetailsAppBarActionButton extends StatelessWidget {
  const RecipeDetailsAppBarActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShareGlassButton();
  }
}
