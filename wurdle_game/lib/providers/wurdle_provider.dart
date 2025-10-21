import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as words;
import 'package:wurdle_game/models/wurdle.dart';

class WurdleProvider extends ChangeNotifier {
  final random = Random.secure();
  List<String> totalWords = [];
  List<String> rowInputs = [];
  List<String> excludedLetters = [];
  List<Wurdle> wurdleBoard = [];
  int count = 0;
  int index = 0;
  final lettersPerRow = 5;

  String targetWord = '';

  init() {
    // get all the 5 character words
    totalWords = words.all.where((element) => element.length == 5).toList();
    generateBoard();
    generateRandomWord();
  }

  generateBoard() {
    wurdleBoard = List.generate(30, (index) => Wurdle(letter: ''));
  }

  generateRandomWord() {
    targetWord = totalWords[random.nextInt(totalWords.length)].toUpperCase();
    print(targetWord);
  }

  inputLetter(String letter) {
    if (count < lettersPerRow) {
      rowInputs.add(letter);
      count++;

      wurdleBoard[index] = Wurdle(letter: letter);
      index++;
    }
    notifyListeners();
  }

  deleteLetter() {
    if (rowInputs.isNotEmpty) {
      rowInputs.removeAt(rowInputs.length - 1);
    }

    if (count > 0) {
      wurdleBoard[index - 1] = Wurdle(letter: '');
      count--;
      index--;
    }

    notifyListeners();
  }

  bool get isAValidWord => totalWords.contains(rowInputs.join('').toLowerCase());
}
