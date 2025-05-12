import 'package:chefio_app/core/helpers/share_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyProfilePopUpMenuButton extends StatelessWidget {
  const MyProfilePopUpMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: context.dialogBackgroundColor,
      child: Icon(
        FontAwesomeIcons.ellipsisVertical,
        color: context.mainTextColor,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.share, color: context.mainTextColor),
                Text(
                  'share Profile',
                  style: Styles.textStyleMedium15(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
            onTap: () async {
            await  getIt<ShareHelper>().shareProfile(
                chefId: context.read<ProfileCubit>().chefId,
              );
            },
          ),
          PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.edit, color: context.mainTextColor),
                  Text(
                  'Edit Profile',
                    style: Styles.textStyleMedium15(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                ],
              ),
              onTap: () {
                context.push(
                  RoutePaths.editProfile,
                  extra: context.read<ProfileCubit>().profileModel,
                );
              }),
        ];
      },
    );
  }
}
