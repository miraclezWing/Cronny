import 'package:flutter/material.dart';

class Eyelid extends StatelessWidget {
  final double eyelidHeight;
  final double eyeWidth;
  final double radius;
  final Color color;

  const Eyelid({
    super.key,
    required this.eyelidHeight,
    this.eyeWidth = 90,
    this.radius = 30,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        width: eyeWidth,
        height: eyelidHeight,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(radius),
          ),
        ),
      ),
    );
  }
}