import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/app_colors.dart';
import 'package:chefio_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        DialogHelper.showWarningDialog(
          context,
          errorMessage: AppLocalizationKeys.auth.logoutConfirmation.tr(),
          btnOkOnPress: () {
            context.read<SettingsCubit>().logout();
          },
        );
      },
      leading: const Icon(
        Icons.logout,
        color: AppColors.logoutText,
      ),
      title: Text(
        AppLocalizationKeys.auth.logout.tr(),
        style: Styles.textStyleMedium15(context).copyWith(
          color: AppColors.logoutText,
        ),
      ),
    );
  }
}
