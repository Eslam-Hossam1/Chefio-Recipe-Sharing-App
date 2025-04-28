import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileSliverAppBar extends StatelessWidget {
  const MyProfileSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        pinned: false,
        floating: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        flexibleSpace: AdaptivePadding(
          child: Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.imagesShare,
                  colorFilter: ColorFilter.mode(
                    context.mainTextColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
