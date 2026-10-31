import 'dart:math' as math;
import 'package:flutter/material.dart';

class Eyes extends StatelessWidget {
  final Offset fingerPosition;

  const Eyes({
    super.key,
    required this.fingerPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Eye(fingerPosition: fingerPosition),
        const SizedBox(width: 40),
        Eye(fingerPosition: fingerPosition),
      ],
    );
  }
}

class Eye extends StatefulWidget {
  final Offset fingerPosition;

  const Eye({
    super.key,
    required this.fingerPosition,
  });

  @override
  State<Eye> createState() => _EyeState();
}

class _EyeState extends State<Eye> {
  final GlobalKey _eyeKey = GlobalKey();

  static const double eyeWidth = 90;
  static const double eyeHeight = 60;
  static const double pupilSize = 22;
  static const double maxMovement = 8;

  Offset _calculatePupilOffset() {
    final context = _eyeKey.currentContext;

    if (context == null) {
      return Offset.zero;
    }

    final RenderBox box = context.findRenderObject() as RenderBox;

    final Offset eyeTopLeft = box.localToGlobal(Offset.zero);

    final Offset eyeCenter = Offset(
      eyeTopLeft.dx + eyeWidth / 2,
      eyeTopLeft.dy + eyeHeight / 2,
    );

    Offset direction = widget.fingerPosition - eyeCenter;

    final double distance = direction.distance;

    if (distance == 0) {
      return Offset.zero;
    }

    direction = direction / distance;

    return direction * math.min(distance, maxMovement);
  }

  @override
  Widget build(BuildContext context) {
    final Offset pupilOffset = _calculatePupilOffset();

    return Container(
      key: _eyeKey,
      width: eyeWidth,
      height: eyeHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 70),
            curve: Curves.easeOut,
            left: (eyeWidth - pupilSize) / 2 + pupilOffset.dx,
            top: (eyeHeight - pupilSize) / 2 + pupilOffset.dy,
            child: Container(
              width: pupilSize,
              height: pupilSize,
              decoration: const BoxDecoration(
                color: Color(0xFF6D4C41),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}