import 'package:bingo/bingo/bingo_model.dart';
import 'package:bingo/bingo/widgets/bingo_button.dart';
import 'package:bingo/common/paths.dart';
import 'package:bingo/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BingoBoard extends StatelessWidget {
  final Widget Function(BuildContext) _startWidget = (context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 64),
          Image.asset(Paths.confetti),
          SizedBox(height: 64),
          Text(
            Strings.start,
            style: TextStyle(color: Colors.grey[800], fontSize: 32),
          ),
          SizedBox(height: 32),
          SizedBox(
              height: 64,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: RaisedButton(
                    color: Colors.orange,
                    child: Text(Strings.createCard),
                    onPressed: () => context.read<BingoModel>().fetch()),
              ))
        ],
      ),
    );
  };

  final Widget Function(List<Square>) _boardWidget = (squares) {
    if (squares.length != 25) {
      return Text(Strings.unknown);
    }

    final List<BingoButton> column1 = squares
        .sublist(0, 5)
        .map((square) => BingoButton(square: square))
        .toList();

    final List<BingoButton> column2 = squares
        .sublist(5, 10)
        .map((square) => BingoButton(square: square))
        .toList();

    final List<BingoButton> column3 = squares
        .sublist(10, 15)
        .asMap()
        .map((key, square) {
          return MapEntry(key, BingoButton(square: square, isCenter: key == 2));
        })
        .values
        .toList();

    final List<BingoButton> column4 = squares
        .sublist(15, 20)
        .map((square) => BingoButton(square: square))
        .toList();

    final List<BingoButton> column5 = squares
        .sublist(20, 25)
        .map((square) => BingoButton(square: square))
        .toList();

    return Row(children: [
      Column(children: column1),
      Column(children: column2),
      Column(children: column3),
      Column(children: column4),
      Column(children: column5),
    ]);
  };

  @override
  Widget build(BuildContext context) {
    final squares = context.watch<BingoModel>().squares;

    return squares.isEmpty ? _startWidget(context) : _boardWidget(squares);
  }
}
