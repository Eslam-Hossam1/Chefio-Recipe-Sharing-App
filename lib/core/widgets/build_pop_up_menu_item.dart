import 'package:chefio_app/core/models/pop_up_menu_model.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

PopupMenuItem buildPopUpMenuItem(
  BuildContext context, {
  required PopUpMenuModel popUpMenuModel,
}) {
  return PopupMenuItem(
    onTap: () {
      popUpMenuModel.onTap(context);
    },
    child: Row(
      children: [
        Icon(
          popUpMenuModel.iconData,
          color: popUpMenuModel.color ?? context.mainTextColor,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          popUpMenuModel.textLocalizationKey.tr(),
          style: Styles.textStyleMedium15(context).copyWith(
            color: popUpMenuModel.color,
          ),
        ),
      ],
    ),
  );
}
