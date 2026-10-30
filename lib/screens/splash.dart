import 'package:flutter/material.dart';
import '../widgets/eyes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Eyes(),
      ),
    );
  }
}