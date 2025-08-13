import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomeEmailTextFormField extends StatelessWidget {
  const CustomeEmailTextFormField({super.key, required this.onSaved, this.initialValue});
  final void Function(String?) onSaved;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: AppLocalizationKeys.auth.emailTextFeildHint.tr(),
      onSaved: onSaved,
      initialValue: initialValue,
      validator: FormValidators.emailTextFormFieldValidator,
      prefixIcon: SvgPicture.asset(
        Assets.imagesEmailIcon,
        colorFilter: ColorFilter.mode(context.mainTextColor, BlendMode.srcIn),
      ),
    );
  }
}
