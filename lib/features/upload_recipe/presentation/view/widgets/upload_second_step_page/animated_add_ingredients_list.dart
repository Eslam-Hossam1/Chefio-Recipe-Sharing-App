import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_second_step_page/enter_ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedAddIngredientsList extends StatelessWidget {
  const AnimatedAddIngredientsList({
    super.key,
    required this.animatedListKey,
    required this.focusNodes,
    required this.ingredientItemsKeys,
  });
  final List<FocusNode> focusNodes;
  final GlobalKey<SliverAnimatedListState> animatedListKey;
  final List<Key> ingredientItemsKeys;
  @override
  Widget build(BuildContext context) {
    var uploadRecipeCubit = context.read<UploadRecipeFormCubit>();
    return SliverAnimatedList(
      key: animatedListKey,
      initialItemCount:
          uploadRecipeCubit.uploadRecipeFormModel.ingredients.length,
      itemBuilder: (context, index, animation) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ),
            ),
            child: Dismissible(
                key: ingredientItemsKeys[index],
                onDismissed: (direction) {
                  uploadRecipeCubit.removeIngredient(
                    index: index,
                  );
                  animatedListKey.currentState!.removeItem(index,
                      (context, animation) {
                    return SizedBox(width: 0, height: 0);
                  });
                  focusNodes.removeAt(index);
                  ingredientItemsKeys.removeAt(index);
                },
                background: Container(
                  color: Colors.red,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                direction:
                    uploadRecipeCubit.uploadRecipeFormModel.ingredients.length <
                            3
                        ? DismissDirection.none
                        : DismissDirection.startToEnd,
                child: EnterIngredientItem(
                  ingredientIndex: index,
                  focusNode: focusNodes[index],
                )),
          ),
        );
      },
    );
  }
}
