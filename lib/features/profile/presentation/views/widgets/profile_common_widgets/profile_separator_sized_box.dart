
import 'package:chefio_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileSeparatorSizedBox extends StatelessWidget {
  const ProfileSeparatorSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (24 *
                (MediaQuery.sizeOf(context).width / Constants.kDesignWidth))
            .clamp(
          24,
          40
        ),
      ),
    );
  }
}
