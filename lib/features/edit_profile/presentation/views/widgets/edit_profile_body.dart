import 'package:chefio_app/core/Functions/convert_to_multipart.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_cancel.dart';
import 'package:chefio_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:chefio_app/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:chefio_app/features/edit_profile/presentation/views/widgets/edit_submit_button.dart';
import 'package:chefio_app/features/edit_profile/presentation/views/widgets/edit_user_avatar.dart';
import 'package:chefio_app/features/edit_profile/presentation/views/widgets/edit_username_text_form_field.dart';
import 'package:chefio_app/features/edit_profile/presentation/views/widgets/username.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key, required this.profileModel});
  final ProfileModel profileModel;
  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;

  @override
  void initState() {
    super.initState();
    final editProfileCubit = context.read<EditProfileCubit>();
    editProfileCubit.chefName = widget.profileModel.profile.username;
    _formKey = GlobalKey();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
        child: Form(
      key: _formKey,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomCancel(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32.h,
            ),
          ),
          EditUserAvatar(
            imageUrl: widget.profileModel.profile.profilePicture,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16.h,
            ),
          ),
          Username(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 42.h,
            ),
          ),
          EditUsernameTextFormField(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: EditSubmitButton(
                  onPressed: () {
                    editSubmitButtonOnPressed(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  void editSubmitButtonOnPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<EditProfileCubit>().editProfile();
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
