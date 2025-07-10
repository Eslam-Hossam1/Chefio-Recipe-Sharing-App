import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_step_image_model.dart';
import 'package:chefio_app/features/upload/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_step_photo_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/step_file_image.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/step_url_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepImageManager extends StatelessWidget {
  const StepImageManager({
    super.key,
    this.recipeDetailsModel,
    required this.index,
  });
  final RecipeDetailsModel? recipeDetailsModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepItemCubit, StepItemState>(
        listener: (context, state) {
      if (state is PickedAddStepImage) {
        context.read<UploadFormCubit>().stepsImageModels.add(
              UploadStepImageModel(
                stepIndex: index,
                stepImageFile: state.stepImageFile,
              ),
            );
      } else if (state is PickedChangeStepImage) {
        context.read<UploadFormCubit>().changeStepImage(
              UploadStepImageModel(
                stepIndex: index,
                stepImageFile: state.stepImageFile,
              ),
            );
      }
    }, builder: (context, state) {
      if (state is PickedStepImageState) {
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
