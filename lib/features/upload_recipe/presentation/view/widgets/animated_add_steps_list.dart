import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/enter_step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedAddStepsList extends StatelessWidget {
  const AnimatedAddStepsList({
    super.key,
    required this.animatedListKey,
    required this.focusNodes,
    required this.stepItemsKeys,
  });
  final List<FocusNode> focusNodes;
  final List<Key> stepItemsKeys;
  final GlobalKey<SliverAnimatedListState> animatedListKey;

  @override
  Widget build(BuildContext context) {
    var uploadRecipeCubit = context.read<UploadFormCubit>();
    return SliverAnimatedList(
      key: animatedListKey,
      initialItemCount: uploadRecipeCubit.uploadRecipeFormModel.steps.length,
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
              key: stepItemsKeys[index],
              onDismissed: (direction) {
                uploadRecipeCubit.removeStep(
                  index: index,
                );
                animatedListKey.currentState!.removeItem(index,
                    (context, animation) {
                  return SizedBox(width: 0, height: 0);
                });
                focusNodes.removeAt(index);
                stepItemsKeys.removeAt(index);
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
              direction: uploadRecipeCubit.uploadRecipeFormModel.steps.length < 3
                  ? DismissDirection.none
                  : DismissDirection.startToEnd,
              child: BlocProvider(
                create: (context) => StepItemCubit(
                  getIt<CroppedImagePickerHelper>(),
                ),
                child: EnterStepItem(
                  stepIndex: index,
                  focusNode: focusNodes[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
