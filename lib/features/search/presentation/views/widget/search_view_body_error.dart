import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBodyError extends StatelessWidget {
  const SearchViewBodyError({super.key, required this.errText});
  final String errText;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  errText,
                  style: Styles.textStyleMedium17(context)
                      .copyWith(color: context.mainTextColor),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextButton(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Try Again",
                    style: Styles.textStyleMedium17(context)
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    context.read<SearchRecipeCubit>().trySearchAgain();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
