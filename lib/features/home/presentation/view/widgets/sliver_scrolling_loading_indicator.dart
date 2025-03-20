import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:flutter/material.dart';

class SliverScrollingLoadingIndIcator extends StatelessWidget {
  const SliverScrollingLoadingIndIcator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: CustomCircularProgressIndicator(),
        ),
      ),
    );
  }
}
