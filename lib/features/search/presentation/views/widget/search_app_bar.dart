import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_back_icon_button.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_text_field.dart';
import 'package:flutter/material.dart';

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
            children: const [
              CustomBackIconButton(),
              SizedBox(
                width: 8,
              ),
              Expanded(child: SearchTextField()),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
