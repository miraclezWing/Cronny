import 'package:flutter/material.dart';

import '../models/expression.dart';

class ExpressionController extends ChangeNotifier {
  Expression _expression = Expression.neutral;

  Expression get expression => _expression;

  bool get isNeutral => _expression == Expression.neutral;
  bool get isHappy => _expression == Expression.happy;
  bool get isThinking => _expression == Expression.thinking;
  bool get isSleepy => _expression == Expression.sleepy;
  bool get isAngry => _expression == Expression.angry;

  void setExpression(Expression expression) {
    if (_expression == expression) return;

    _expression = expression;
    notifyListeners();
  }

  void reset() {
    setExpression(Expression.neutral);
  }
}