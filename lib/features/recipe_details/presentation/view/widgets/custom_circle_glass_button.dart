import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCircleGlassButton extends StatelessWidget {
  const CustomCircleGlassButton({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.transparent,
          child: Center(
            child: child,
          )
        ),
      ),
    );
  }
}
