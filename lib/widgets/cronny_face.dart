import 'package:flutter/material.dart';

import '../controllers/expression_controller.dart';
import '../models/expression.dart';
import 'eyebrows.dart';
import 'eyes.dart';

class CronnyFace extends StatelessWidget {
  final Offset fingerPosition;
  final Expression expression;
  final ExpressionController controller;

  const CronnyFace({
    super.key,
    required this.fingerPosition,
    required this.controller,
    this.expression = Expression.neutral,
  });

  @override
  Widget build(BuildContext context) {
  return AnimatedBuilder(
    animation: controller,
    builder: (context, child) {
      final currentExpression = controller.expression;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Eyebrows(
            expression: currentExpression,
          ),

          const SizedBox(height: 8),

          Eyes(
            fingerPosition: fingerPosition,
            expression: currentExpression,
          ),
        ],
      );
    },
  );
}
}