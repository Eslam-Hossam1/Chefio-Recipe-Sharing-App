
import 'package:flutter/material.dart';

class TabletFormContainer extends StatelessWidget {
  const TabletFormContainer({super.key, required this.child});
  final Widget Function(BuildContext) child;
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.sizeOf(context).width * 0.65).clamp(400, 540);
    return Center(
      child: SizedBox(
        width: width,
        child: child(context),
      ),
    );
  }
}
