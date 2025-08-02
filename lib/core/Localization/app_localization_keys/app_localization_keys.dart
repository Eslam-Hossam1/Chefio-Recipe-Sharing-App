import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/auth.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/notifications_localization.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/profile_localization.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/search_loclaization.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/global_localization_singletones/categories.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/global_localization_singletones/app_localization_errors.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/global_localization_singletones/global.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/on_boarding.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/profile_setup.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/recipe_details.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/features_localization_singletones/upload.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/global_localization_singletones/languages_localization_keys.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/global_localization_singletones/themes_localization_keys.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/global_localization_singletones/time_units.dart';

abstract class AppLocalizationKeys {
  static const OnBoarding onBoarding = OnBoarding.instance;
  static const Auth auth = Auth.instance;
  static const ProfileSetup profileSetup = ProfileSetup.instance;
  static const Global global = Global.instance;
  static const Errors error = Errors.instance;
  static const Upload upload = Upload.instance;
  static const LocalizationCategory category = LocalizationCategory.instance;
  static const RecipeDetails recipeDetails = RecipeDetails.instance;
  static const ProfileLocalization profile = ProfileLocalization.instance;
  static const ThemesLocalization themes = ThemesLocalization.instance;
  static const LanguagesLocalization languages = LanguagesLocalization.instance;
  static const TimeUnitsLocalization timeUnits = TimeUnitsLocalization.instance;
  static const NotificationsLocalization notifications =
      NotificationsLocalization.instance;
  static const SearchLoclaization search = SearchLoclaization.instance;
}
