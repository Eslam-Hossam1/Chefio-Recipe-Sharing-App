import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/follow_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowButtonConsumer extends StatefulWidget {
  const FollowButtonConsumer({
    super.key,
    required this.isFollowing,
    required this.chefId,
    this.chefConnectionEntity,
  });
  final bool isFollowing;
  final String chefId;
  final ChefConnectionEntity? chefConnectionEntity;

  @override
  State<FollowButtonConsumer> createState() => _FollowButtonConsumerState();
}

class _FollowButtonConsumerState extends State<FollowButtonConsumer> {
  late bool isFollowing;
  late String chefId;
  @override
  void initState() {
    super.initState();
    isFollowing = widget.isFollowing;
    chefId = widget.chefId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowChefCubit, FollowChefState>(
      listener: (context, state) {
        if ((state is FollowChefSuccess) && state.chefId == chefId) {
          isFollowing = !isFollowing;
        }
        if (state is FollowChefFaiure) {
          showCustomToast(
            context,
            message: state.errorLocalizationKey.tr(),
            seconds: 2,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is FollowChefLoading && state.chefId == chefId;
        return FollowButton(
          isLoading: isLoading,
          isFollowing: isFollowing,
          onPressed: () {
            context.read<FollowChefCubit>().toggleFollowChef(
                  chefId: chefId,
                  chefConnectionEntity:widget.chefConnectionEntity,
                );
          },
        );
      },
    );
  }
}
