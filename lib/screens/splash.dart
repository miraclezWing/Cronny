import 'package:flutter/material.dart';

import '../widgets/cronny_face.dart';
import '../controllers/expression_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Offset fingerPosition = Offset.zero;
  
  final ExpressionController controller = ExpressionController();

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(onPanUpdate: (details)
                       {
                   setState(() {
                     fingerPosition = details.localPosition;
    });
  },
  child: Scaffold(
    body: Center(
      child: CronnyFace(
        fingerPosition: fingerPosition,
        controller: controller,
      ),
    ),
  ),
);
  }
}