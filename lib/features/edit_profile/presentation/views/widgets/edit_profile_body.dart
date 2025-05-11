import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_back_icon_button.dart';
import 'package:chefio_app/core/widgets/custom_cancel.dart';
import 'package:chefio_app/core/widgets/custom_circle_image.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;

  @override
  void initState() {
    super.initState();
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
            child:
                Align(alignment: Alignment.centerLeft, child: CustomCancel()),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Stack(
                children: [
                  CustomCircleImage(
                    baseSize: 150,
                    userImageUrl:
                        "https://i.ytimg.com/vi/mEhYtnHQAUw/maxresdefault.jpg",
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: context.mainTextColor,
                      child: Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: context.scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                'Doja Cat',
                style: Styles.textStyleBold22(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 42.h,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              hint: AppLocalizationKeys.auth.usernameTextFeildHint.tr(),
              prefixIcon: Icon(
                FontAwesomeIcons.user,
                size: 24,
                color: context.mainTextColor,
              ),
              onSaved: (value) {},
              validator: FormValidators.usernameTextFormFieldValidator,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 32.h),
                  child: CustomTextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      } else {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    width: double.infinity,
                    child: Text(
                      "Submit",
                      style: Styles.textStyleBold15(context)
                          .copyWith(color: Colors.white),
                    ),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
