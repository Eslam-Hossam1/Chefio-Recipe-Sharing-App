import 'dart:io';

import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/upload/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/step_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepFileImage extends StatelessWidget {
  const StepFileImage(
      {super.key, required this.fileImage, required this.stepImageIndex});
  final File fileImage;
  final int stepImageIndex;
  @override
  Widget build(BuildContext context) {
        final stepItemCubit = context.read<StepItemCubit>();

    return GestureDetector(
      onTap: () async {
        final parentContext =
            context; 
        bool? pickImage;
        pickImage = await showDialog(
          context: parentContext,
          builder: (context) {
            return StepImageDialog(
              parentContext: parentContext,
              stepImageIndex: stepImageIndex,
              imageViewer: Image.file(
                fileImage,
              ),
            );
          },
        );
        if (pickImage != null && pickImage) {
          showModalBottomSheet(
            backgroundColor: context.scaffoldBackgroundColor,
            context: context,
            builder: (context) {
              return ChooseImageSourceBottomSheet(
                pickImageMethod: stepItemCubit.pickImageForChanging,
              );
            },
          );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 271 / 155,
          child: Image.file(
            fit: BoxFit.cover,
            fileImage,
          ),
        ),
      ),
    );
  }
}
