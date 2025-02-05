import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:easy_localization/easy_localization.dart';

String? customTextFormFieldValidator(String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizationKeys.auth.thisFieldRequired.tr();
  } else {
    return null;
  }
}
