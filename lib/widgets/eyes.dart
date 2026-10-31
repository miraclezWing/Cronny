import 'package:flutter/material.dart';

import '../models/expression.dart';
import 'eye.dart';

class Eyes extends StatelessWidget {
  final Offset fingerPosition;
  final Expression expression;

  const Eyes({
    super.key,
    required this.fingerPosition,
    this.expression = Expression.neutral,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Eye(
          fingerPosition: fingerPosition,
          expression: expression,
        ),
        const SizedBox(width: 40),
        Eye(
          fingerPosition: fingerPosition,
          expression: expression,
        ),
      ],
    );
  }
}