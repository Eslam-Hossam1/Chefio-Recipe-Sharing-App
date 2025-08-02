import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/core/widgets/add_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRecipeAddIngredintButton extends StatelessWidget {
  const EditRecipeAddIngredintButton({
    super.key,
    required this.ingredientsFocusNodes,
    required this.ingredientsItemKeys,
    required this.ingredientsAnimatedListKey,
  });

  final List<FocusNode> ingredientsFocusNodes;
  final List<GlobalKey> ingredientsItemKeys;
  final GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey;

  @override
  Widget build(BuildContext context) {
    return AddButton(
      onPressed: () => _handleAddIngredient(context),
      text: AppLocalizationKeys.upload.addIngredient.tr(),
    );
  }

  Future<void> _handleAddIngredient(BuildContext context) async {
    _addIngredientToCubitAndHelpers(context);

    await Future.delayed(const Duration(milliseconds: 300));

    final newItemContext = ingredientsItemKeys.last.currentContext;
    if (newItemContext == null) return;

    await _scrollToNewIngredient(newItemContext);
    _requestFocusOnNewIngredient();
  }

  void _addIngredientToCubitAndHelpers(BuildContext context) {
    final cubit = context.read<EditRecipeFormCubit>();
    cubit.addIngerdient(
      ingredientsAnimatedListKey: ingredientsAnimatedListKey,
    );
    ingredientsFocusNodes.add(FocusNode());
    ingredientsItemKeys.add(GlobalKey());
  }

  Future<void> _scrollToNewIngredient(BuildContext itemContext) async {
    await Scrollable.ensureVisible(
      itemContext,
      duration: const Duration(milliseconds: 500),
      alignment: 0.4,
      curve: Curves.easeInOut,
    );
  }

  void _requestFocusOnNewIngredient() {
    ingredientsFocusNodes.last.requestFocus();
  }
}
