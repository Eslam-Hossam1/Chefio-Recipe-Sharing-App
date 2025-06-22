import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_info_message.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchViewBodyEmpty extends StatelessWidget {
  const SearchViewBodyEmpty({super.key});

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  textAlign: TextAlign.center,
                  AppLocalizationKeys.search.noResultsFound.tr(),
                  style: Styles.textStyleMedium17(context)
                      .copyWith(color: context.mainTextColor),
                ),
              ),
            )),
      ],
    );
  }
}
