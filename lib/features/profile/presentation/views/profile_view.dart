import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profil_view_body.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_view_body_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.chefId});
  final String chefId;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<ProfileCubit>().fetchChefProfileWithInitialRecipes(
          chefId: widget.chefId,
          limit: 0,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfileViewBodyConsumer(
          onSuccessProfileViewBody: (context) => ProfileViewBody(),
        ),
      ),
    );
  }
}
