import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/core/widgets/add_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStepButton extends StatelessWidget {
  const AddStepButton({
    super.key,
    required this.stepsItemKeys,
    required this.stepsFocusNodes,
    required this.stepsAnimatedListKey,
    required this.scrollController,
  });

  final List<GlobalKey> stepsItemKeys;
  final List<FocusNode> stepsFocusNodes;
  final GlobalKey<SliverAnimatedListState> stepsAnimatedListKey;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return AddButton(
      onPressed: () => _handleAddStep(context),
      text: AppLocalizationKeys.upload.addStep.tr(),
    );
  }

  Future<void> _handleAddStep(BuildContext context) async {
    _addStepToCubitAndHelpers(context);

    await Future.delayed(const Duration(milliseconds: 300));

    final newItemContext = stepsItemKeys.last.currentContext;
    if (newItemContext == null) return;

    await _scrollToNewStep(newItemContext);
    await _scrollToBottomIfPartiallyHidden(newItemContext);
    _requestFocusOnNewStep();
  }

  void _addStepToCubitAndHelpers(BuildContext context) {
    final cubit = context.read<UploadRecipeFormCubit>();
    cubit.addStep(stepsAnimatedListKey: stepsAnimatedListKey);

    stepsFocusNodes.add(FocusNode());
    stepsItemKeys.add(GlobalKey());
  }

  Future<void> _scrollToNewStep(BuildContext itemContext) async {
    await Scrollable.ensureVisible(
      itemContext,
      duration: const Duration(milliseconds: 500),
      alignment: 0.4,
      curve: Curves.easeInOut,
    );
  }

  Future<void> _scrollToBottomIfPartiallyHidden(
      BuildContext itemContext) async {
    await Future.delayed(const Duration(milliseconds: 100));

    final renderBox = itemContext.findRenderObject() as RenderBox;
    final itemOffset = renderBox.localToGlobal(Offset.zero);
    final itemBottom = itemOffset.dy + renderBox.size.height;
    final screenHeight = MediaQuery.of(itemContext).size.height;

    final isPartiallyHidden = itemBottom > screenHeight;

    if (isPartiallyHidden) {
      await scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _requestFocusOnNewStep() {
    stepsFocusNodes.last.requestFocus();
  }
}
