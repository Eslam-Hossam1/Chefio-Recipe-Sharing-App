import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_liked_recipes_cubit/chef_liked_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_follow_button_builder.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_liked_recipes_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_liked_recipes_scrolling_loading_indicator_builder.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_recipes_scrolling_loading_indicator_builder.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_separator_sized_box.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_user_avatar.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_username.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/sliver_profile_persistent_tab_bar.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/user_info_row.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key,required this.profileModel});
  final ProfileModel profileModel;
  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late RefreshController _refreshController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    _refreshController = RefreshController();

    _tabController.addListener(() {
      setState(() {});
    });
    _scrollController.addListener(_onScroll);
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      context.read<ChefLikedRecipesCubit>().refersh(
            chefId: widget.profileModel.id,
          ),
      context.read<ProfileCubit>().refresh(),
    ]);
    _refreshController.refreshCompleted(); // Stop refresh indicator
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      if (_tabController.index == 0) {
        context.read<ChefProfileRecipesCubit>().fetchChefRecipes(
              chefId: widget.profileModel.id,
            );
      } else {
        context.read<ChefLikedRecipesCubit>().fetchChefLikedRecipes(
             chefId: widget.profileModel.id,
            );
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: _onRefresh,
      controller: _refreshController,
      header: ClassicHeader(),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildProfileHeaderSection(),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 8,
              height: 8,
              color: context.formColor,
            ),
          ),
          SliverProfilePersistentTabBar(tabController: _tabController),
          SliverToBoxAdapter(child: ProfileSeparatorSizedBox()),
          if (_tabController.index == 0)
            SliverAdaptivePadding(sliver: ProfileChefRecipesConsumer(chefId: widget.profileModel.id,),)
          else
            SliverAdaptivePadding(sliver: ProfileLikedRecipesConsumer(chefId: widget.profileModel.id,),),
          ProfileRecipesScrollingLoadingIndicatorBuilder(),
          ProfileLikedRecipesScrollingLoadingIndicatorbuilder()
        ],
      ),
    );
  }

  Widget _buildProfileHeaderSection() {
    return SliverList(
      delegate: SliverChildListDelegate( [
        const SizedBox(height: 16),
        const ProfileAppBar(),
        const SizedBox(height: 20),
        ProfileUserAvatar(profileModel: widget.profileModel,),
       const SizedBox(
          height: 24,
        ),
        ProfileUsername(profileModel: widget.profileModel,),
       const SizedBox(height: 24),
        UserInfoRow(profileModel: widget.profileModel,),
       const SizedBox(height: 24),
       const ProfileFollowButtonBuilder()
      ]),
    );
  }
}
