// FILE: upload_form_data.dart
part of 'edit_recipe_second_step_page.dart';

class EditRecipeFormData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();
  final GlobalKey<SliverAnimatedListState> stepsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();

  final List<GlobalKey> ingredientsItemKeys;
  final List<GlobalKey> stepsItemKeys;

  final ScrollController scrollController = ScrollController();

  final List<FocusNode> ingredientsFocusNodes;
  final List<FocusNode> stepsFocusNodes;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  EditRecipeFormData({
    required int ingredientsLength,
    required int stepsLength,
  })  : ingredientsItemKeys = List.generate(
          ingredientsLength,
          (e) => GlobalKey(),
        ),
        stepsItemKeys = List.generate(
          stepsLength,
          (e) => GlobalKey(),
        ),
        stepsFocusNodes = List.generate(
          stepsLength,
          (e) => FocusNode(),
        ),
        ingredientsFocusNodes = List.generate(
          ingredientsLength,
          (e) => FocusNode(),
        );
  void enableAutoValidation() {
    autovalidateMode = AutovalidateMode.always;
  }

  void dispose() {
    scrollController.dispose();
    for (final node in ingredientsFocusNodes) {
      node.dispose();
    }
    for (final node in stepsFocusNodes) {
      node.dispose();
    }
  }
}
