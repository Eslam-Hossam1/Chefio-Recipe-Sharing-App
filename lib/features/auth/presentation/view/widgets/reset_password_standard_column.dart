import 'dart:developer';

import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_reset_password/validate_reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/password_standard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordStandardsColumn extends StatelessWidget {
  const ResetPasswordStandardsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidateResetPasswordCubit, ValidateResetPasswordState>(
      builder: (context, state) {
        log(state.toString() + "from builder");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizationKeys.auth.signUpViewYourPasswordMustContain.tr(),
              style: Styles.textStyleMedium17(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateResetPasswordCubit>(context)
                  .isMinLengthValid,
              standardText:
                  AppLocalizationKeys.auth.signUpViewAtLeastCharacters.tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateResetPasswordCubit>(context)
                  .isContainsNumberValid,
              standardText:
                  AppLocalizationKeys.auth.signUpViewMustContainNumber.tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateResetPasswordCubit>(context)
                  .isContainsUppercaseLetter,
              standardText: AppLocalizationKeys
                  .auth.signUpViewContainsUppercaseLetter
                  .tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateResetPasswordCubit>(context)
                  .isContainsSpecialLetter,
              standardText:
                  AppLocalizationKeys.auth.signUpViewContainsSpecialLetter.tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateResetPasswordCubit>(context)
                  .isContainsLowercaseLetter,
              standardText: AppLocalizationKeys
                  .auth.signUpViewContainsLowercaseLetter
                  .tr(),
            )
          ],
        );
      },
    );
  }
}
