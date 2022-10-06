import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  final int height;
  final int weight;
  double? _bmi;

  String calculatorBMI() {
    _bmi = weight / pow(height, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You fat, bitch! Stop eating McDonald';
    } else if (_bmi! >= 18.5) {
      return 'Normal';
    } else {
      return 'Go to gym & get swollen, bro!';
    }
  }
}
