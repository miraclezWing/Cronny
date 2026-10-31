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
      angle = left ? -12 : 12;
      break;

    case Expression.angry:
      angle = left ? 18 : -18;
      break;

    case Expression.sleepy:
      angle = 0;
      break;

    case Expression.thinking:
      angle = left ? 12 : 0;
      break;

    default:
      angle = 0;
  }
  return AnimatedContainer(
  duration: const Duration(milliseconds: 250),
  curve: Curves.easeInOut,
  margin: EdgeInsets.only(
    bottom: expression == Expression.happy ? 4 : 0,
  ),
  child: AnimatedRotation(
    turns: angle / 360,
    duration: const Duration(milliseconds: 250),
    curve: Curves.easeInOut,
    child: Container(
      width: 22,
      height: 3,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
}
}