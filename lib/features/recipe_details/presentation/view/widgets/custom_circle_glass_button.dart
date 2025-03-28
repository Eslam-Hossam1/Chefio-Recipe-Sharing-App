import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCircleGlassButton extends StatelessWidget {
  const CustomCircleGlassButton({
    super.key,
    required this.child,
    this.onPressed,
  });
  final Widget child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
