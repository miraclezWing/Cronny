import 'package:flutter/material.dart';

class EyeShell extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const EyeShell({
    super.key,
    this.width = 63,
    this.height = 63,
    this.radius = 12,
    this.color = const Color(0xFF87A5FF),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}