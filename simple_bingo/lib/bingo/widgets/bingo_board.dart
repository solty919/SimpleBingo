import 'package:bingo/bingo/bingo_model.dart';
import 'package:bingo/bingo/widgets/bingo_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BingoBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final squares = context.watch<BingoModel>().squares;

    final List<BingoButton> row1 = squares
        .sublist(0, 5)
        .map((square) => BingoButton(square: square))
        .toList();

    final List<BingoButton> row2 = squares
        .sublist(5, 10)
        .map((square) => BingoButton(square: square))
        .toList();

    final List<BingoButton> row3 = squares
        .sublist(10, 15)
        .asMap()
        .map((key, square) {
          return MapEntry(key, BingoButton(square: square, isCenter: key == 2));
        })
        .values
        .toList();

    final List<BingoButton> row4 = squares
        .sublist(15, 20)
        .map((square) => BingoButton(square: square))
        .toList();

    final List<BingoButton> row5 = squares
        .sublist(20, 25)
        .map((square) => BingoButton(square: square))
        .toList();

    return Column(children: [
      Row(children: row1),
      Row(children: row2),
      Row(children: row3),
      Row(children: row4),
      Row(children: row5),
    ]);
  }
}
