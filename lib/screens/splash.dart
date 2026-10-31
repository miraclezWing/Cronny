import 'package:flutter/material.dart';
import '../widgets/eyes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Offset fingerPosition = Offset.zero;

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
      child: Eyes(
        fingerPosition: fingerPosition,
      ),
    ),
  ),
);
  }
}