
import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditUsernameTextFormField extends StatelessWidget {
  const EditUsernameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomTextFormField(
        hint: AppLocalizationKeys.auth.usernameTextFeildHint.tr(),
        prefixIcon: Icon(
          FontAwesomeIcons.user,
          size: 24,
          color: context.mainTextColor,
        ),
        onSaved: (value) {},
        validator: FormValidators.usernameTextFormFieldValidator,
      ),
    );
  }
}
