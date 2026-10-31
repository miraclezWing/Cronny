import 'package:flutter/material.dart';

import '../models/expression.dart';

class Eyebrows extends StatelessWidget {
  final Expression expression;

  const Eyebrows({
    super.key,
    required this.expression,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildEyebrow(left: true),
          _buildEyebrow(left: false),
        ],
      ),
    );
  }

  Widget _buildEyebrow({required bool left}) {
  double angle = 0;

  switch (expression) {
    case Expression.happy:
      angle = left ? -0.2 : 0.2;
      break;

    case Expression.angry:
      angle = left ? 0.3 : -0.3;
      break;

    case Expression.sleepy:
      angle = 0;
      break;

    default:
      angle = 0;
  }

  return AnimatedRotation(
    turns: angle / (2 * 3.14159),
    duration: const Duration(milliseconds: 250),
    curve: Curves.easeInOut,
    child: Container(
      width: 20,
      height: 3,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
  }
}