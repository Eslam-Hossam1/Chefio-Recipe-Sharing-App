import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/search_button.dart';
import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CategoriesListView(),
        ),
      ),
      pinned: false,
      floating: true,
      expandedHeight: 100,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          children: [
            AdaptivePadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chefio',
                    style: Styles.textStyleBold22(context)
                        .copyWith(color: context.primaryColor),
                  ),
                  const SearchButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
