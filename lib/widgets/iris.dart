import 'package:flutter/material.dart';

class Iris extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const Iris({
    super.key,
    this.width = 22.44,
    this.height = 42.45,
    this.radius = 12,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 70),
      curve: Curves.easeOut,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}