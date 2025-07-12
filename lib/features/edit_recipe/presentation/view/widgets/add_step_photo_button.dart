import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class AddStepPhotoButton extends StatelessWidget {
  const AddStepPhotoButton({
    super.key,
    required this.pickImageMethodForAdding,
  });
  final dynamic Function({required ImageSource imageSource})
      pickImageMethodForAdding;
  @override
  Widget build(BuildContext context) {
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
                pickImageMethod: pickImageMethodForAdding,
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
