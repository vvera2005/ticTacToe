import 'package:flutter/material.dart';

enum FilledWith { x, o, none }

class TicTakProvider extends ChangeNotifier {
  final Map<int, FilledWith> _elements = {
    0: FilledWith.none,
    1: FilledWith.none,
    2: FilledWith.none,
    3: FilledWith.none,
    4: FilledWith.none,
    5: FilledWith.none,
    6: FilledWith.none,
    7: FilledWith.none,
    8: FilledWith.none,
  };
  FilledWith _winner = FilledWith.none;
  FilledWith _stage = FilledWith.none;
  Map<int, FilledWith> get elements => _elements;
  FilledWith get stage => _stage;
  FilledWith get winner => _winner;

  void newGame() {
    for (int i = 0; i < 9; i++) {
      _elements[i] = FilledWith.none;
    }
    _winner = FilledWith.none;
    _stage = FilledWith.none;
    notifyListeners();
  }

  void addX({required int index}) {
    _winner = checkWinner();
    _elements[index] = FilledWith.x;
    _stage = FilledWith.o;
    notifyListeners();
  }

  void addO({required int index}) {
    _winner = checkWinner();
    _elements[index] = FilledWith.o;
    _stage = FilledWith.x;
    notifyListeners();
  }

  void startGame() {
    _stage = FilledWith.x;
    notifyListeners();
  }

  FilledWith checkWinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (final combination in winningCombinations) {
      final values = combination.map((index) => _elements[index]).toList();
      if (values.every((element) => element != FilledWith.none) &&
          values.toSet().length == 1) {
        return values[0]!;
      }
    }
    return FilledWith.none;
  }
}
