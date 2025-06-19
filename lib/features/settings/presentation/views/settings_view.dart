import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/utils/Localization/app_languages.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/theme/app_theme_options.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:chefio_app/features/settings/presentation/views/widgets/logout_button.dart';
import 'package:chefio_app/features/settings/presentation/views/widgets/setting_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;

    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationkey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is SettingsSuccess) {
          context.go(RoutePaths.login);
        }
      },
      builder: (context, state) {
        bool isLoading = state is SettingsLoading;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizationKeys.global.settings.tr(),
                  style: TextStyle(color: context.mainTextColor)),
              backgroundColor: context.scaffoldBackgroundColor,
              elevation: 0,
              iconTheme: IconThemeData(color: context.mainTextColor),
              surfaceTintColor: Colors.transparent,
            ),
            backgroundColor: context.scaffoldBackgroundColor,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: const SizedBox(height: 12)),
                SettingTile(
                  icon: Icons.palette,
                  title: AppLocalizationKeys.themes.theme.tr(),
                  value: AppThemeOptions.getThemeModeOptionFromThemeMode(theme)
                      .localizationKey
                      .tr(),
                  onTap: () => context.push(RoutePaths.themeSelection),
                ),
                SettingTile(
                  icon: Icons.translate,
                  title: AppLocalizationKeys.languages.language.tr(),
                  value: AppLanguages.getLanguageFromCurrentLocale(context)
                      .languageLocalizationKey
                      .tr(),
                  onTap: () => context.push(RoutePaths.languageSelection),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Spacer(),
                      LogoutButton(),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
