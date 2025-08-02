import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/core/widgets/custom_File_circle_image.dart';
import 'package:chefio_app/core/widgets/custom_circle_image.dart';
import 'package:chefio_app/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserAvatar extends StatefulWidget {
  const EditUserAvatar({
    super.key,
    required this.imageUrl,
  });
  final String? imageUrl;

  @override
  State<EditUserAvatar> createState() => _EditUserAvatarState();
}

class _EditUserAvatarState extends State<EditUserAvatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = context.read<EditProfileCubit>();

    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        final isImagePicked = editProfileCubit.chefProfilePicture != null;
        return SliverToBoxAdapter(
          child: Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: context.scaffoldBackgroundColor,
                  context: context,
                  builder: (context) {
                    return ChooseImageSourceBottomSheet(
                      pickImageMethod: editProfileCubit.pickRecipeImage,
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  isImagePicked
                      ? CustomFileCircleImage(
                          image: editProfileCubit.chefProfilePicture!,
                          baseSize: 150,
                        )
                      : CustomNetworkCircleImage(
                          baseSize: 150,
                          userImageUrl:
                              widget.imageUrl ?? Constants.nullUserImageUrl,
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
        );
      },
    );
  }
}
