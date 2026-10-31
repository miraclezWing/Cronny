import 'package:flutter/material.dart';

import '../models/expression.dart';
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
      void initState() {
        super.initState();
  
  controller.setExpression(Expression.happy);
  }

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onPanUpdate: (details) {
      setState(() {
        fingerPosition = details.localPosition;
      });
    },
    child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: CronnyFace(
                  fingerPosition: fingerPosition,
                  controller: controller,
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      controller.setExpression(Expression.neutral),
                  child: const Text("😐"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      controller.setExpression(Expression.happy),
                  child: const Text("😊"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      controller.setExpression(Expression.angry),
                  child: const Text("😠"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      controller.setExpression(Expression.sleepy),
                  child: const Text("😴"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      controller.setExpression(Expression.thinking),
                  child: const Text("🤔"),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}
}