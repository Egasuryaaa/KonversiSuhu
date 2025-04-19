import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {
  double _inputValue = 0;
  Map<String, double> _convertedValues = {};

  double get inputValue => _inputValue;
  Map<String, double> get convertedValues => _convertedValues;

  void setInputValue(double value) {
    _inputValue = value;
    _convertTemperature();
    notifyListeners();
  }

  void _convertTemperature() {
    double celsius = _inputValue;
    _convertedValues = {
      "Celsius": celsius,
      "Fahrenheit": celsius * 9 / 5 + 32,
      "Kelvin": celsius + 273.15,
      "Reamur": celsius * 4 / 5
    };
  }
}