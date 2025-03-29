import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/search/presentation/views/widget/filter_icon.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          Assets.imagesIosBackOutline,
          colorFilter: ColorFilter.mode(
            context.mainTextColor,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: SearchTextField(),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: FilterIcon(),
        ),
      ],
    );
  }
}
