import 'package:flutter/material.dart';

class Square {
  Square(this.isCheck, this.number);

  bool isCheck;
  final int number;
}

class BingoModel with ChangeNotifier {
  final squares = List<Square>(25).map((e) => Square(false, 3)).toList();

  void add() {
    final square = Square(true, 10);
    squares.add(square);
    notifyListeners();
  }

  void toggle(Square square) {
    square.isCheck = !square.isCheck;
    notifyListeners();
  }
}
