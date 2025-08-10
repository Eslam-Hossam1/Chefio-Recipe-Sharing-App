import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorView extends StatelessWidget {
  final String? errorMessage;
  final AuthCredentialsHelper authCredentialsHelper;
  const ErrorView({super.key, this.errorMessage, required this.authCredentialsHelper});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = authCredentialsHelper.userIsAuthenticated();

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: context.colorScheme.error,
                size: 80,
              ),
              const SizedBox(height: 16),
              Text(
                'Oops! Something went wrong.',
                style: Styles.textStyleBold22(context)
                    .copyWith(color: context.mainTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                errorMessage ?? 'Unknown error',
                style: Styles.textStyleMedium15(context)
                    .copyWith(color: context.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (isLoggedIn) {
                    context.go(RoutePaths.home);
                  } else {
                    context.go(RoutePaths.login);
                  }
                },
                child: Text(
                  isLoggedIn ? 'Go to Home' : 'Go to Login',
                  style: Styles.textStyleBold15(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
