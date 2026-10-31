import 'package:flutter/material.dart';

class Highlight extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const Highlight({
    super.key,
    this.width = 5.64,
    this.height = 10.68,
    this.radius = 12,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
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