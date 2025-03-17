import 'package:chefio_app/features/upload/presentation/manager/cubit/add_ingredients_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/enter_ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedAddIngredientsList extends StatefulWidget {
  const AnimatedAddIngredientsList({
    super.key,
    required this.animatedListKey,
    required this.ingredientsList,
  });

  final GlobalKey<SliverAnimatedListState> animatedListKey;
  final List ingredientsList;
  @override
  State<AnimatedAddIngredientsList> createState() =>
      _AnimatedAddIngredientsListState();
}

class _AnimatedAddIngredientsListState
    extends State<AnimatedAddIngredientsList> {
  late List ingredients;
  @override
  void initState() {
    ingredients = widget.ingredientsList;
    super.initState();
  }

  void removeIngredient(int index) {
    widget.animatedListKey.currentState!.removeItem(index,
        (context, animation) {
      return SizedBox(width: 0, height: 0);
    });
    ingredients.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: widget.animatedListKey,
      initialItemCount: ingredients.length,
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
                key: Key('${ingredients[index].hashCode}'),
                onDismissed: (direction) => removeIngredient(index),
                background: Container(
                  color: Colors.red,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                direction:ingredients.length<2? DismissDirection.none: DismissDirection.startToEnd,
                child: EnterIngredientItem()),
          ),
        );
      },
    );
  }
}
