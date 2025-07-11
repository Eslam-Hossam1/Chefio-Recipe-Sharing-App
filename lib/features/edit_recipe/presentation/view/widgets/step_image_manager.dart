import 'package:chefio_app/features/edit_recipe/data/models/my_step_image_model.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepImageManager extends StatefulWidget {
  const StepImageManager({
    super.key,
    this.recipeDetailsModel,
    required this.index,
  });
  final RecipeDetailsModel? recipeDetailsModel;
  final int index;
  @override
  State<StepImageManager> createState() => _StepImageBuilderState();
}

class _StepImageBuilderState extends State<StepImageManager> {
  @override
  void initState() {
    context.read<StepItemCubit>().init(
          imageUrl: widget.recipeDetailsModel?.steps[widget.index].stepImage,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepItemCubit, StepItemState>(
        listener: (context, state) {
      if (state is PickedAddStepImage) {
        context.read<EditRecipeFormCubit>().stepsImageModels.add(
              MyStepImageModel(
                stepIndex: widget.index,
                stepImageFile: state.stepImageFile,
              ),
            );
      } else if (state is PickedChangeStepImage) {
        context.read<EditRecipeFormCubit>().changeStepImage(
              MyStepImageModel(
                stepIndex: widget.index,
                stepImageFile: state.stepImageFile,
              ),
            );
      }
    }, builder: (context, state) {
      if (state is UrlImage) {
        return StepUrlImage(
          url: state.imageUrl,
        );
      } else if (state is PickedStepImageState) {
        return StepFileImage(
          fileImage: state.stepImageFile,
          stepImageIndex: widget.index,
        );
      } else {
        return AddStepPhotoButton();
      }
    });
  }
}
