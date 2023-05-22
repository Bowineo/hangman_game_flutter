import 'package:flutter/material.dart';
import 'package:hangman_game/src/constants/helpers.dart';

class Game with ChangeNotifier {
  bool _endGame = false;
  bool _victory = false;
  int _attemptCount = 0;
  bool get endGame => _endGame;
  bool get victory => _victory;
  int get attemptCount => _attemptCount;

  void setFalse() {
    _endGame = false;
    _victory = false;
    _attemptCount = 0;
  }

  bool isVictory(List<String> listLetters, String word) {
    bool output = true;
    for (var i = 0; i < word.length; i++) {
      output = output && listLetters.contains(word[i].toUpperCase());
    }
    return output;
  }

  bool itLost(int nAttempts) {
    return nAttempts == _attemptCount;
  }

  bool isAcentuation(String word, String letter) {
    bool output = false;
    if (letter.toUpperCase() == "A") {
      for (var item in kA) {
        output = output || (word.contains(item));
      }
    }
    if (letter.toUpperCase() == "E") {
      for (var item in kE) {
        output = output || (word.contains(item));
      }
    }
    if (letter.toUpperCase() == "I") {
      for (var item in kI) {
        output = output || (word.contains(item));
      }
    }
    if (letter.toUpperCase() == "O") {
      for (var item in kO) {
        output = output || (word.contains(item));
      }
    }
    if (letter.toUpperCase() == "U") {
      for (var item in kU) {
        output = output || (word.contains(item));
      }
    }
    if (letter.toUpperCase() == "C") {
      for (var item in kC) {
        output = output || (word.contains(item));
      }
    }
    return output;
  }

  void checking(
      String letter, String word, int nAttempts, List<String> listLetters) {
    if (isVictory(listLetters, word.toUpperCase())) {
      _victory = true;
      _endGame = true;

      notifyListeners();
      return;
    } else {
      if (!word.toUpperCase().contains(letter.toUpperCase()) &&
          !isAcentuation(word, letter)) {
        _attemptCount++;
        notifyListeners();
      }
    }
    if (itLost(nAttempts)) {
      _endGame = true;
      _victory = false;
      notifyListeners();
      return;
    }
  }
}
