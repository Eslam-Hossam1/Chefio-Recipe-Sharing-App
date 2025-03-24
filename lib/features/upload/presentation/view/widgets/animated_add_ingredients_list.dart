import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/enter_ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedAddIngredientsList extends StatelessWidget {
  const AnimatedAddIngredientsList({
    super.key,
    required this.animatedListKey,
  });

  final GlobalKey<SliverAnimatedListState> animatedListKey;

  @override
  Widget build(BuildContext context) {
    var uploadRecipeCubit = context.read<UploadRecipeCubit>();
    return SliverAnimatedList(
      key: animatedListKey,
      initialItemCount: uploadRecipeCubit.ingredients.length,
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
                key: Key('${uploadRecipeCubit.ingredients[index].hashCode}'),
                onDismissed: (direction) => uploadRecipeCubit.removeIngredient(
                      ingredientsAnimatedListKey: animatedListKey,
                      index: index,
                    ),
                background: Container(
                  color: Colors.red,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                direction: uploadRecipeCubit.ingredients.length < 2
                    ? DismissDirection.none
                    : DismissDirection.startToEnd,
                child: EnterIngredientItem(
                  ingredientIndex: index,
                )),
          ),
        );
      },
    );
  }
}
