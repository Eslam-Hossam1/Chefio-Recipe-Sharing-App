import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/password_standards/password_standards_column.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_password_cubit/validate_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/obsecure_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_done_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  String? password;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          ObsecureTextFormField(
            validator: BlocProvider.of<ValidatePasswordCubit>(context)
                .passwordTextFieldValidator,
            onChanged: BlocProvider.of<ValidatePasswordCubit>(context)
                .validatePasswordOnChange,
            hint: AppLocalizationKeys.auth.passwordTextFieldHint.tr(),
            onSaved: (value) {
              password = value?.trim();
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          const PasswordStandardsColumn(),
          SizedBox(
            height: 48.h,
          ),
          ResetPasswordDoneButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await BlocProvider.of<ResetPasswordCubit>(context)
                    .resetPassword(password: password!);
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
