import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_back_icon_button.dart';
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
      backgroundColor: context.scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      expandedHeight: 80,
      pinned: false,
      floating: true,

      surfaceTintColor: Colors.transparent,
      flexibleSpace: Center(
        child: AdaptivePadding(
          child: Row(
            children: [
              CustomBackIconButton(),
              SizedBox(
                width: 8,
              ),
              Expanded(child: SearchTextField()),
              SizedBox(
                width: 8,
              ),
              IconButton(
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
            ],
          ),
        ),
      ),
      // leading: IconButton(
      //   onPressed: () {
      //     context.pop();
      //   },
      //   icon: SvgPicture.asset(
      //     Assets.imagesIosBackOutline,
      //     colorFilter: ColorFilter.mode(
      //       context.mainTextColor,
      //       BlendMode.srcIn,
      //     ),
      //   ),
      // ),
      // title: SearchTextField(),
      // centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 16),
      //     child: IconButton(
      //       onPressed: () {
      //         showModalBottomSheet(
      //             backgroundColor: context.scaffoldBackgroundColor,
      //             context: context,
      //             builder: (context) {
      //               return SearchFilterBottomSheet();
      //             });
      //       },
      //       icon: FilterIcon(),
      //     ),
      //   ),
      // ],
    );
  }
}
