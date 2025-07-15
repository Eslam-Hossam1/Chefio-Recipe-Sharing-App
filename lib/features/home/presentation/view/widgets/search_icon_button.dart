import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.push('${RoutePaths.home}/${RoutePaths.search}');
      },
      icon: SvgPicture.asset(
        Assets.imagesSearch,
        colorFilter: ColorFilter.mode(context.mainTextColor, BlendMode.srcIn),
      ),
    );
  }
}
