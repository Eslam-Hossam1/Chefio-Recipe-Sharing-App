import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/my_profile/presentation/view/widgets/my_profile_sliver_app_bar.dart';
import 'package:chefio_app/features/profile_common/widgets/profile_tab_bar_and_tab_view_section.dart';
import 'package:chefio_app/features/profile_common/widgets/profile_user_avatar_with_title.dart';
import 'package:chefio_app/features/profile_common/widgets/user_info_row.dart';
import 'package:flutter/material.dart';

class MyProfileViewBody extends StatelessWidget {
  const MyProfileViewBody({super.key});

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
            MyProfileSliverAppBar(),
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
              child: SizedBox(
                height: 24,
              ),
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
