import 'package:flutter/material.dart';
import 'Alphabet.dart';

class ButtonStatus with ChangeNotifier, Alphabet {
  List<bool> _buttonStatus = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List<bool> get buttonStatus => _buttonStatus;

  void setIndex(bool status, int index) {
    _buttonStatus[index] = status;
    notifyListeners();
  }

  void setAll(bool status) {
    for (var i = 0; i < _buttonStatus.length; i++) {
      _buttonStatus[i] = status;
    }
    notifyListeners();
  }
}
