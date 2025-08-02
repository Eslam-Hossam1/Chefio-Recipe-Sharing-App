import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_connections_cubit/chef_connections_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_connections_bottom_sheet_body_builder.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_following_bottom_sheet_body_builder.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/scrollable_sheet_dragger_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChefFollowingsBottomSheet extends StatefulWidget {
  const ChefFollowingsBottomSheet({
    super.key,
    required this.chefId,
  });
  final String chefId;
  @override
  State<ChefFollowingsBottomSheet> createState() =>
      _ChefFollowingsBottomSheetState();
}

class _ChefFollowingsBottomSheetState extends State<ChefFollowingsBottomSheet> {
  @override
  initState() {
    context.read<ChefConnectionsCubit>().fetchChefFollowing(
          chefId: widget.chefId,
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
                          child: ChefConnectionsBottomSheetBodyBuilder(
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
