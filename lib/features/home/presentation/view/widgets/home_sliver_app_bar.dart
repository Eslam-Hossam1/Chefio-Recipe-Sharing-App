import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key, this.searchWidget});
  final Widget? searchWidget;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      expandedHeight: 60,
      flexibleSpace: AdaptivePadding(
        top: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.imagesChefioLogo,
              width: 22.w,
              height: 22.w,
            ),
            searchWidget ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
