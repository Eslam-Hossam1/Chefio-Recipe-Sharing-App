import 'dart:developer';

import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_view_body_mobile.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_view_body_table.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          mobileLayout: (context) => HomeViewBodyMobile(),
          tabletLayout: (context) => HomeViewBodyTablet(),
        ),
      ),
    );
  }
}
