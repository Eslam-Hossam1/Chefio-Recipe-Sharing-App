import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_cover_photo_cubit.dart/edit_recipe_cover_photo_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EmptyCoverPhoto extends StatelessWidget {
  const EmptyCoverPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
                backgroundColor: context.scaffoldBackgroundColor,
                context: context,
                builder: (context) {
                  return ChooseImageSourceBottomSheet(
                    pickImageMethod: context.read<EditRecipeCoverPhotoCubit>().pickRecipeImage,
                  );
                },
              );
      },
      child: DottedBorder(
          borderType: BorderType.RRect,
          color: context.secondaryTextColor,
          dashPattern: [6, 6, 6, 6],
          radius: Radius.circular(16),
          padding: EdgeInsets.all(17),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesUploadImage),
                SizedBox(
                  height: 16,
                ),
                Text(
                  AppLocalizationKeys.upload.addCoverPhoto.tr(),
                  style: Styles.textStyleBold15(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  AppLocalizationKeys.upload.upTo.tr(),
                  style: Styles.textStyleMedium12(context).copyWith(
                    color: context.secondaryTextColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
