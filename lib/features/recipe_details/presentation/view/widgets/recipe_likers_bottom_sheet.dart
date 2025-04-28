import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_likers_cubit/recipe_likers_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_likers_bottom_sheet_body_builder.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/scrollable_sheet_dragger_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecipeLikersBottomSheet extends StatefulWidget {
  const RecipeLikersBottomSheet({
    super.key,
    required this.recipeId,
  });
  final String recipeId;
  @override
  State<RecipeLikersBottomSheet> createState() =>
      _RecipeLikersBottomSheetState();
}

class _RecipeLikersBottomSheetState extends State<RecipeLikersBottomSheet> {
  @override
  initState() {
    context.read<RecipeLikersCubit>().fetchRecipeLikers(
          recipeId: widget.recipeId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            color: Colors.transparent,
            child: DraggableScrollableSheet(
              maxChildSize: .9,
              minChildSize: .6,
              initialChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: ScrollableSheetDraggerIcon(),
                        ),
                        Expanded(
                          child: RecipeLikersBottomSheetBodyBuilder(
                            scrollController: scrollController,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
