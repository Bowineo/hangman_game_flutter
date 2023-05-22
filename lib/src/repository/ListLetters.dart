import 'package:flutter/material.dart';

class ListLetters with ChangeNotifier {
  List<String> _listLetters = [];

  List<String> get listLetters => _listLetters;

  void setLetter(String letter) {
    _listLetters.add(letter.toUpperCase());
    notifyListeners();
  }

  void setAllLetters(List<String> letters) {
    _listLetters.addAll(letters);
    notifyListeners();
  }

  void removeLetter(String letter) {
    _listLetters.remove(letter.toUpperCase());
    notifyListeners();
  }

  void clearListLetter() {
    _listLetters.clear();
    notifyListeners();
  }

  bool contains(String letter) {
    return _listLetters.contains(letter.toUpperCase());
  }

  void printer() {
    for (var letter in _listLetters) {
      print("letter : $letter");
      print("length : " + _listLetters.length.toString());
    }
  }
}
