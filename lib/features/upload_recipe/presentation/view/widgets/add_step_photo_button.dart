import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddStepPhotoButton extends StatelessWidget {
  const AddStepPhotoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stepItemCubit = context.read<StepItemCubit>();

    return SizedBox(
      width: double.infinity,
      height: 44,
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: context.scaffoldBackgroundColor,
            context: context,
            builder: (context) {
              return ChooseImageSourceBottomSheet(
                pickImageMethod: stepItemCubit.pickAndSetImage,
              );
            },
          );
        },
        style: TextButton.styleFrom(
            backgroundColor: context.formColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        child: SvgPicture.asset(
          Assets.imagesCamera,
          colorFilter: ColorFilter.mode(
            context.mainTextColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
