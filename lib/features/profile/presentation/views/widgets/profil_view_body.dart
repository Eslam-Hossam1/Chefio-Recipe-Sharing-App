import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_follow_button_builder.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_tab_bar_and_tab_view_section.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_user_avatar_with_title.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/user_info_row.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            ProfileSliverAppBar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverAdaptivePadding(
              sliver: ProfileUserAvatarWithTitle(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: UserInfoRow(),
            ),
            SliverToBoxAdapter(
              child: ProfileFollowButtonBuilder(),
            ),
            SliverToBoxAdapter(
              child: Divider(
                thickness: 8,
                height: 8,
                color: context.formColor,
              ),
            ),
          ];
        },
        body: ProfileTabBarAndTabViewSection(),
      ),
    );
  }
}
