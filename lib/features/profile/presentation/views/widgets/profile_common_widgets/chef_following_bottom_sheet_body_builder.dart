import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_info_message.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_connections_cubit/chef_connections_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_connections_list_view.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_following_list_view.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/skeletonizer_chef_connections_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowingBottomSheetBodyBuilder extends StatelessWidget {
  const ChefFollowingBottomSheetBodyBuilder({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefConnectionsCubit, ChefConnectionsState>(
      builder: (context, state) {
        if (state is ChefConnectionsFailure) {
          return CustomTextInfoMessage(
            text: state.errorLocalizationKey.tr(),
          );
        } else if (state is ChefConnectionsSuccess) {
          return ChefFollowingListView(
            scrollController: scrollController,
            chefConnections:
                context.read<ChefConnectionsCubit>().chefConnections!,
          );
        } else if (state is ChefHasNoFollowers) {
          return CustomTextInfoMessage(
            text: AppLocalizationKeys.profile.chefHasNoFollwers.tr(),
          );
        } else if (state is ChefHasNoFollowings) {
          return CustomTextInfoMessage(
            text: AppLocalizationKeys.profile.chefDidntFollowAnyChefYet.tr(),
          );
        } else {
          return SkeletonizerChefConnectionsListView(
            scrollController: scrollController,
          );
        }
      },
    );
  }
}
