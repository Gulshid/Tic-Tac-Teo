import 'package:flutter/material.dart';
import 'package:tac_tic_teo/model_/GameModel.dart';

class Gameprovider with ChangeNotifier {
  // ignore: unused_field, prefer_final_fields
  Gamemodel _model = Gamemodel.initial();

  List<String> get board => _model.board!;
  Player get currentPlayer => _model.currentPlayer!;
  bool get gameOver => _model.gameOver!;
  String get result => _model.result!;

  //Make a function for Movement
  void makeMove(int index) {
    if (_model.board![index] != '' || _model.gameOver!) return;
    _model.board![index] = _model.currentPlayer == Player.X ? "X" : "O";

    if (_checkWinner(_model.board![index])) {
      _model.gameOver = true;
      _model.result = "${_model.board![index]} Wins!";
    } else if (!_model.board!.contains('')) {
      _model.gameOver = true;
      _model.result = 'It\'s a Draw';
    } else {
      _model.currentPlayer =
          _model.currentPlayer == Player.X ? Player.O : Player.X;
    }
    notifyListeners();
  }

  //Make a list for check the winner
  // ignore: unused_element
  bool _checkWinner(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (_model.board![pattern[0]] == player &&
          _model.board![pattern[1]] == player &&
          _model.board![pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  //Make a function for reset Game
  void resetGame() {
    _model = Gamemodel.initial();
    notifyListeners();
  }
}
