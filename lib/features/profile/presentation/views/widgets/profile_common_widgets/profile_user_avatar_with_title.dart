import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserAvatarWithTitle extends StatelessWidget {
  const ProfileUserAvatarWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Image.asset(Assets.imagesBigUserAvatarImageTest);
                  });
            },
            child: Center(
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: (100.w).clamp(80, 140),
                  width: (100.w).clamp(80, 140),
                  child: Image.asset(Assets.imagesBigUserAvatarImageTest)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              'Choirul Syafril',
              style: Styles.textStyleBold17(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
