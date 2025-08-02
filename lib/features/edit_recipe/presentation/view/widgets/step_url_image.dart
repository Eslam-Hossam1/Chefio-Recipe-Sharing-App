import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_step_item_cubit/edit_step_item_cubit.dart';
import 'package:chefio_app/core/widgets/step_image_dialog.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/step_image_url_thumnail.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class StepUrlImage extends StatelessWidget {
  const StepUrlImage(
      {super.key,
      required this.url,
      required this.stepImageIndex,
      required this.pickImageMethodForChanging});
  final String url;
  final int stepImageIndex;
  final Future<void> Function({required ImageSource imageSource})
      pickImageMethodForChanging;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final parentContext = context;
        bool? pickImage;
        pickImage = await showStepImageDialog(pickImage, parentContext);
        if (pickImage != null && pickImage) {
          if (context.mounted) {
            showChooseImageMethodBottomSheet(context);
          }
        }
      },
      child: StepImageUrlThumbnail(
        url: url,
      ),
    );
  }

  Future<bool?> showStepImageDialog(
      bool? pickImage, BuildContext parentContext) async {
    pickImage = await showDialog(
      context: parentContext,
      builder: (context) {
        return StepImageDialog(
          removeImageMethod: () {
            parentContext.read<EditRecipeFormCubit>().removeStepImage(
                  index: stepImageIndex,
                );
            parentContext.read<EditStepItemCubit>().removeImage();
          },
          stepImageIndex: stepImageIndex,
          imageViewer: CustomCachedNetworkImage(url: url,),
        );
      },
    );
    return pickImage;
  }

  void showChooseImageMethodBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: context.scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return ChooseImageSourceBottomSheet(
          pickImageMethod: pickImageMethodForChanging,
        );
      },
    );
  }
}
