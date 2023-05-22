import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hangman_game/src/constants/all_words.dart';
import 'package:hangman_game/src/constants/animals.dart';
import 'package:hangman_game/src/constants/countries.dart';
import 'package:hangman_game/src/constants/fruits.dart';
import 'package:hangman_game/src/constants/objects.dart';

const String kImageBackground = "assets/images/background.png";
const String kItLost = "assets/images/itLost.gif";
const String kWon = "assets/images/won.gif";
const String kImageSplashScreen = "assets/images/hangman.gif";

const kColorDefault = Color.fromARGB(255, 8, 98, 139);

List<String> kA = ["a", "à", "á", "â", "ã", "A", "À", "Á", "Â", "Ã"];
List<String> kE = ["e", "è", "é", "ê", "E", "È", "É", "Ê"];
List<String> kI = ["i", "ì", "í", "î", "I", "Ì", "Í", "Î"];
List<String> kO = ["o", "ò", "ó", "ô", "õ", "O", "Ò", "Ó", "Ô", "Õ"];
List<String> kU = ["u", "ù", "ú", "û", "U", "Ù", "Ú", "Û"];
List<String> kC = ["c", "ç", "C", "Ç"];

List<String> _a = ["a", "à", "á", "â", "ã", "À", "Á", "Â", "Ã"];
List<String> _e = ["e", "è", "é", "ê", "È", "É", "Ê"];
List<String> _i = ["i", "ì", "í", "î", "Ì", "Í", "Î"];
List<String> _o = ["o", "ò", "ó", "ô", "õ", "Ò", "Ó", "Ô", "Õ"];
List<String> _u = ["u", "ù", "ú", "û", "Ù", "Ú", "Û"];
List<String> _c = ["c", "ç", "Ç"];

List<String> kGenders = ["TODOS", "FRUTAS", "ANIMAIS", "PAÍSES", "OBJETOS"];

String textRaw(List<String> listLetters) {
  List<String> list = listLetters;
  String output = "";
  output = removeCharacters(list);
  output = output.substring(1, (output.toString().length - 1));
  return output;
}

String removeCharacters(List<String> listLetters) {
  if (listLetters.contains("A")) {
    for (var element in _a) {
      listLetters.remove(element);
    }
  }
  if (listLetters.contains("E")) {
    for (var element in _e) {
      listLetters.remove(element);
    }
  }
  if (listLetters.contains("I")) {
    for (var element in _i) {
      listLetters.remove(element);
    }
  }
  if (listLetters.contains("O")) {
    for (var element in _o) {
      listLetters.remove(element);
    }
  }
  if (listLetters.contains("U")) {
    for (var element in _u) {
      listLetters.remove(element);
    }
  }
  if (listLetters.contains("C")) {
    for (var element in _c) {
      listLetters.remove(element);
    }
  }

  String output = listLetters.toString().replaceAll(",", " -");
  return output;
}

String stageHangman(int index) {
  return "assets/images/$index.png";
}


String interrogationWord(String word) {
  String output = "";
  for (var i = 0; i < word.length; i++) {
    output = output + " ? ";
  }
  return output;
}

String getWord(List<String> words) {
  return words[Random().nextInt(words.length)];
}

String getWordForGender(int gender) {
  List<String> words = [];
  switch (gender) {
    case 0:
      words = kAllWords;
      break;
    case 1:
      words = kFruits;
      break;
    case 2:
      words = kAnimals;
      break;
    case 3:
      words = kCountries;
      break;
    case 4:
      words = kObjects;
      break;
    default:
      words = kAllWords;
      break;
  }
  return words[Random().nextInt(words.length)];
}

bool haveLetter(String letter, String word) {
  return word.toUpperCase().contains(letter.toUpperCase());
}

bool isActivated(String resp) {
  return resp.split(";")[0].toLowerCase() == "true";
}

String whatLetter(String resp) {
  return resp.split(";")[1];
}
