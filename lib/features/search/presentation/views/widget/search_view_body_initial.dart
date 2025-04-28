import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_error_message.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_app_bar.dart';
import 'package:flutter/material.dart';

class SearchViewBodyInitial extends StatelessWidget {
  const SearchViewBodyInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SearchAppBar(),
        SliverToBoxAdapter(
          child: Divider(
            height: 48,
            thickness: 8,
            color: context.formColor,
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                'write some recipe name to search about',
                style: Styles.textStyleMedium17(context)
                    .copyWith(color: context.mainTextColor),
              ),
            )),
      ],
    );
  }
}
