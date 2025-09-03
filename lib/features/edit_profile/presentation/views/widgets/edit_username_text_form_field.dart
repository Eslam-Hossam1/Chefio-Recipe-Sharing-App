import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditUsernameTextFormField extends StatelessWidget {
  const EditUsernameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = context.read<EditProfileCubit>();
    return SliverToBoxAdapter(
      child: CustomTextFormField(
        initialValue: editProfileCubit.chefName,
        hint: AppLocalizationKeys.auth.usernameTextFeildHint.tr(),
        prefixIcon: Icon(
          FontAwesomeIcons.user,
          size: 24,
          color: context.mainTextColor,
        ),
        onChanged: (value) {
          editProfileCubit.onChangeUsername(username: value);
        },
        onSaved: (value) {
          editProfileCubit.chefName = value!;
        },
        validator: FormValidators.usernameTextFormFieldValidator,
      ),
    );
  }
}
