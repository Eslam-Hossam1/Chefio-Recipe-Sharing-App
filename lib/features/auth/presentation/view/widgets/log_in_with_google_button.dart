import 'dart:developer';

import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/services/google_auth_service.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/auth/presentation/manager/log_in_cubit.dart/log_in_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInWithGoogleButton extends StatelessWidget {
  const LogInWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextButton(
            onPressed: () async {
              await BlocProvider.of<LogInCubit>(context).logInWithGoogle();
            },
            backgroundColor: const Color(0xffFF5842),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesGoogleIcon),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Google",
                  style: Styles.textStyleBold15(context)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
