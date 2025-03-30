import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/search/presentation/views/widget/filter_icon.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_filter_bottom_sheet.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: context.scaffoldBackgroundColor,
                  context: context,
                  builder: (context) {
                    return SearchFilterBottomSheet();
                  });
            },
            icon: FilterIcon(),
          ),
        ),
      ],
    );
  }
}
