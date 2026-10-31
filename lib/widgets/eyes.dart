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
        Eye(fingerPosition:fingerPosition),
        SizedBox(width: 40),
        Eye(fingerPosition:fingerPosition),
      ],
    );
  }
}

class Eye extends StatelessWidget {
  final Offset fingerPosition;
  
  const Eye({super.key,
       required this.fingerPosition,
       });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 34,
            top: 19,
            child: Container(
              width: 22,
              height: 22,
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