import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/my_profile_view_body.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_view_body_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfileViewBodyConsumer(
          onSuccessProfileViewBody: (context) => MyProfileViewBody(),
        ),
      ),
    );
  }
}
