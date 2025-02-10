import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
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

class LogInWithGoogleButton extends StatelessWidget {
  const LogInWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorMessage,
            btnOkOnPress: () {},
          );
        } else if (state is LogInSuccess) {
          context.go(AppRouter.kHomeView);
        }
      },
      builder: (context, state) {
        bool isLoading = (state is LogInLoadingWithEmailAndPassword) ||
            (state is LogInLoadingWithGoogle);
        bool showLoadingIndicator = (state is LogInLoadingWithGoogle);
        return Row(
          children: [
            Expanded(
              child: AbsorbPointer(
                absorbing: showLoadingIndicator,
                child: CustomTextButton(
                  backgroundColor: const Color(0xffFF5842),
                  child: isLoading
                      ? Center(
                          child: CustomCircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Row(
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
            ),
          ],
        );
      },
    );
  }
}
