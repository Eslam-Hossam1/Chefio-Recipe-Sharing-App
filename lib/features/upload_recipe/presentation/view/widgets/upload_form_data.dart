// FILE: upload_form_data.dart
part of 'upload_second_step_page.dart';

class UploadFormData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();
  final GlobalKey<SliverAnimatedListState> stepsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();

  final List<GlobalKey> ingredientsItemKeys = [GlobalKey(), GlobalKey()];
  final List<GlobalKey> stepsItemKeys = [GlobalKey(), GlobalKey()];

  final ScrollController scrollController = ScrollController();

  final List<FocusNode> ingredientsFocusNodes = [FocusNode(), FocusNode()];
  final List<FocusNode> stepsFocusNodes = [FocusNode(), FocusNode()];

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
