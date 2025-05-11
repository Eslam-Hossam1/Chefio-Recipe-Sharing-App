import 'package:chefio_app/features/edit_profile/presentation/views/widgets/edit_profile_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: EditProfileBody(),
    ));
  }
}
