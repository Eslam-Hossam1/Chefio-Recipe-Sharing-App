import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class Username extends StatelessWidget {
  const Username({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          'Doja Cat',
          style: Styles.textStyleBold22(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
      ),
    );
  }
}
