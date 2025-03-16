import 'package:chefio_app/features/upload/presentation/view/widgets/upload_first_step_page.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_second_step_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadView extends StatelessWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: UploadSecondStepPage(),),
    );
  }
}
