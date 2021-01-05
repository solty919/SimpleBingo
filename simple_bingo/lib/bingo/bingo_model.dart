import 'package:flutter/material.dart';

class Square {
  Square(this.isCheck, this.number);

  bool isCheck;
  final int number;
}

class BingoModel with ChangeNotifier {
  final squares = <Square>[];

  void fetch() async {}

  void toggle(Square square) {
    square.isCheck = !square.isCheck;
    notifyListeners();
  }
}
