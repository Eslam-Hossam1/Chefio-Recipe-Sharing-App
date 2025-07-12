import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_step_item_cubit/edit_step_item_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/add_step_photo_button.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_step_file_image.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/step_url_image.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditStepImageManager extends StatefulWidget {
  const EditStepImageManager({
    super.key,
    this.recipeDetailsModel,
    required this.index,
  });
  final RecipeDetailsModel? recipeDetailsModel;
  final int index;
  @override
  State<EditStepImageManager> createState() => _StepImageBuilderState();
}

class _StepImageBuilderState extends State<EditStepImageManager> {
  @override
  void initState() {
    context.read<EditStepItemCubit>().init(
          imageUrl: widget.recipeDetailsModel?.steps[widget.index].stepImage,
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
      } else if (state is PickedStepImageState) {
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
