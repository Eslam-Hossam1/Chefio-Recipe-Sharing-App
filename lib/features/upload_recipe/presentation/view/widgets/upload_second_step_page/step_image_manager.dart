import 'package:chefio_app/features/upload_recipe/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_second_step_page/add_step_photo_button.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_second_step_page/step_file_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepImageManager extends StatelessWidget {
  const StepImageManager({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepItemCubit, StepItemState>(
        listener: (context, state) {
      if (state is PickedSetStepImage) {
        context.read<UploadRecipeFormCubit>().setStepImage(
              stepIndex: index,
              stepImageFile: state.stepImageFile,
            );
      }
    }, builder: (context, state) {
      if (state is PickedSetStepImage) {
        return StepFileImage(
          fileImage: state.stepImageFile,
          stepImageIndex: index,
        );
      } else {
        return AddStepPhotoButton();
      }
    });
  }
}
