import 'package:flutter/material.dart';

class Eyes extends StatelessWidget {
  const Eyes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Eye(),
        SizedBox(width: 40),
        Eye(),
      ],
    );
  }
}

class Eye extends StatelessWidget {
  const Eye({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Color(0xFF6D4C41),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}