import 'package:chefio_app/features/my_profile/presentation/view/widgets/my_profile_view_body.dart';
import 'package:flutter/cupertino.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MyProfileViewBody());
  }
}
