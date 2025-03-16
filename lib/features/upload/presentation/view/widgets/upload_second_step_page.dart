import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/sliver_uplaod_header.dart';
import 'package:flutter/material.dart';

class UploadSecondStepPage extends StatelessWidget {
  const UploadSecondStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      top:12,
      child: CustomScrollView(
        slivers: [
          SliverUploadHeader(
            currentStep: '2',
            steps: '2',
          ),
          
        ],
      ),
    );;
  }
}