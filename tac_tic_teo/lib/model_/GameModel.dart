enum Player { X, O }

class Gamemodel {
  List<String>? board;
  Player? currentPlayer;
  bool? gameOver;
  String? result;

  Gamemodel({
    required this.board,
    required this.currentPlayer,
    required this.gameOver,
    required this.result,
  });

  factory Gamemodel.initial() {
    return Gamemodel(
      board: List.filled(9, ''),
      currentPlayer: Player.X,
      gameOver: false,
      result: '',
    );
  }
}
