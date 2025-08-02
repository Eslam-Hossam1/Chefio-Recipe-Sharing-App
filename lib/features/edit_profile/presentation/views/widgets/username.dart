import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Username extends StatelessWidget {
  const Username({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return Center(
            child: Text(
              textAlign: TextAlign.center,
              context.read<EditProfileCubit>().chefName,
              style: Styles.textStyleBold22(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
