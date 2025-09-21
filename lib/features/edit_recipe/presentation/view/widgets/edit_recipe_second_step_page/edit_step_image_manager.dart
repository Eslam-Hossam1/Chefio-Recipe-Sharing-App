import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_step_item_cubit/edit_step_item_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/add_step_photo_button.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_step_file_image.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/step_url_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditStepImageManager extends StatefulWidget {
  const EditStepImageManager({
    super.key,
    required this.index,
  });
  final int index;
  @override
  State<EditStepImageManager> createState() => _StepImageBuilderState();
}

class _StepImageBuilderState extends State<EditStepImageManager> {
  @override
  void initState() {
    EditRecipeFormModel editRecipeFormModel =
        context.read<EditRecipeFormCubit>().editRecipeFormModel;
    context.read<EditStepItemCubit>().init(
          imageUrl: editRecipeFormModel.steps[widget.index].stepUrlImage,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditStepItemCubit, StepItemState>(
        listener: (context, state) {
      if (state is PickedSetStepImage) {
        context.read<EditRecipeFormCubit>().setStepImage(
              stepImageFile: state.stepImageFile,
              stepIndex: widget.index,
            );
      }
    }, builder: (context, state) {
      if (state is UrlImage) {
        return StepUrlImage(
          url: state.imageUrl,
          stepImageIndex: widget.index,
          pickImageMethodForChanging:
              context.read<EditStepItemCubit>().pickAndSetImage,
        );
      } else if (state is PickedSetStepImage) {
        return EditStepFileImage(
          pickImageMethodForChanging:
              context.read<EditStepItemCubit>().pickAndSetImage,
          fileImage: state.stepImageFile,
          stepImageIndex: widget.index,
        );
      } else {
        return AddStepPhotoButton(
          pickImageMethodForAdding:
              context.read<EditStepItemCubit>().pickAndSetImage,
        );
      }
    });
  }
}
