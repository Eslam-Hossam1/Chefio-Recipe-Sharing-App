import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageSourceBottomSheet extends StatelessWidget {
  const ChooseImageSourceBottomSheet({
    super.key,
    required this.pickImageMethod,
  });
  final Function({required ImageSource imageSource}) pickImageMethod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () async {
                await pickImageMethod(imageSource: ImageSource.gallery);
                if (!context.mounted) return;
                context.pop();
              },
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                leading: SvgPicture.asset(
                  Assets.imagesGallery,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    context.mainTextColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  AppLocalizationKeys.global.takeFromGallery.tr(),
                  style: Styles.textStyleMedium17(context)
                      .copyWith(color: context.mainTextColor),
                ),
              )),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () async {
                await pickImageMethod(imageSource: ImageSource.camera);
                if (!context.mounted) return;
                context.pop();
              },
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                leading: SvgPicture.asset(
                  Assets.imagesCamera,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    context.mainTextColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  AppLocalizationKeys.global.takeFromCamera.tr(),
                  style: Styles.textStyleMedium17(context)
                      .copyWith(color: context.mainTextColor),
                ),
              )),
        ],
      ),
    );
  }
}
