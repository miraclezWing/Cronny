import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../models/expression.dart';

import 'eye_shell.dart';
import 'iris.dart';
import 'highlight.dart';

class Eye extends StatefulWidget {
  final Offset fingerPosition;
  final Expression expression;

  const Eye({
    super.key,
    required this.fingerPosition,
    this.expression = Expression.neutral,
  });

  @override
  State<Eye> createState() => _EyeState();
}

class _EyeState extends State<Eye> {
  final GlobalKey _eyeKey = GlobalKey();

  static const double shellSize = 63.0;
  static const double irisWidth = 22.44;
  static const double irisHeight = 42.45;
  static const double maxMovement = 8.0;

  Offset _calculateOffset() {
    final context = _eyeKey.currentContext;

    if (context == null) {
      return Offset.zero;
    }

    final RenderBox box =
        context.findRenderObject() as RenderBox;

    final Offset eyeCenter =
        box.localToGlobal(Offset(
      shellSize / 2,
      shellSize / 2,
    ));

    Offset direction =
        widget.fingerPosition - eyeCenter;

    final distance = direction.distance;

    if (distance == 0) {
      return Offset.zero;
    }

    direction = direction / distance;

    return direction *
        math.min(distance, maxMovement);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _calculateOffset();

    return SizedBox(
      key: _eyeKey,
      width: shellSize,
      height: shellSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            const EyeShell(),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 70),
              curve: Curves.easeOut,
              left: (shellSize - irisWidth) / 2 + offset.dx,
              top: (shellSize - irisHeight) / 2 + offset.dy,
              child: Stack(
                children: [
                  const Iris(),

                  const Positioned(
                    left: 4,
                    top: 6,
                    child: Highlight(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}