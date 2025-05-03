import 'package:chefio_app/features/profile/presentation/views/widgets/profil_view_body.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_view_body_consumer.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfileViewBodyConsumer(
          onSuccessProfileViewBody: (context) => ProfileViewBody(),
        ),
      ),
    );
  }
}
