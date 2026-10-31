import 'package:flutter/material.dart';

class Pupil extends StatelessWidget {
  final double pupilSize;

  const Pupil({
    super.key,
    this.pupilSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: pupilSize,
          height: pupilSize,
          decoration: const BoxDecoration(
            color: Color(0xFF6D4C41),
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          left: 5,
          top: 4,
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}