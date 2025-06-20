import 'package:chefio_app/core/helpers/share_helper.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_back_icon_button.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackIconButton(),
          IconButton(
            onPressed: () async => getIt<ShareHelper>().shareProfile(
              chefId: context.read<ProfileCubit>().profileModel!.id,
            ),
            icon: SvgPicture.asset(
              Assets.imagesShare,
              colorFilter: ColorFilter.mode(
                context.mainTextColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
