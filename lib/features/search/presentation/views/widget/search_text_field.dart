import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      maxLines: 1,
      controller: textEditingController,
      textInputAction: TextInputAction.search,
      hint: AppLocalizationKeys.global.search.tr(),
      prefixIcon: SvgPicture.asset(
        Assets.imagesSearch,
        colorFilter: ColorFilter.mode(
          context.secondaryTextColor,
          BlendMode.srcIn,
        ),
      ),
      suffixIcon: IconButton(
        onPressed: () {
          textEditingController.clear();
        },
        icon: SvgPicture.asset(
          Assets.imagesCloseIcon,
          colorFilter: ColorFilter.mode(
            context.mainTextColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
