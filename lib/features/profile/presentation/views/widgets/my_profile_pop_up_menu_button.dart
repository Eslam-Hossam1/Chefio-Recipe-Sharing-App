import 'package:chefio_app/core/helpers/share_helper.dart';
import 'package:chefio_app/core/models/pop_up_menu_model.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/build_pop_up_menu_item.dart';
import 'package:chefio_app/features/profile/presentation/manager/my_profile_cubit/my_profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyProfilePopUpMenuButton extends StatelessWidget {
  const MyProfilePopUpMenuButton({super.key});

  static final List<PopUpMenuModel> popUpModels = [
    PopUpMenuModel(
      iconData: Icons.share,
      textLocalizationKey: AppLocalizationKeys.profile.shareProfile,
      onTap: (context) async {
        await getIt<ShareHelper>().shareProfile(
          chefId: context.read<ProfileCubit>().profileModel!.id,
        );
      },
    ),
    PopUpMenuModel(
      iconData: Icons.edit,
      textLocalizationKey: AppLocalizationKeys.profile.editProfile,
      onTap: (context) {
        context.push(
          RoutePaths.editProfile,
          extra: context.read<MyProfileCubit>().profileModel,
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: context.dialogBackgroundColor,
      child: Icon(
        FontAwesomeIcons.ellipsisVertical,
        color: context.mainTextColor,
      ),
      itemBuilder: (context) => List.generate(
        popUpModels.length,
        (index) => buildPopUpMenuItem(
          context,
          popUpMenuModel: popUpModels[index],
        ),
      ),
    );
  }
}
