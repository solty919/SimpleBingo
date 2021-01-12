import 'package:bingo/bingo/bingo_model.dart';
import 'package:bingo/bingo/models/models.dart';
import 'package:bingo/bingo/widgets/bingo_bottom.dart';
import 'package:bingo/bingo/widgets/bingo_button.dart';
import 'package:bingo/common/paths.dart';
import 'package:bingo/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//finalでない変数をプロパティとして持ちたいためStatefulWidget
class BingoBoard extends StatefulWidget {
  @override
  _BingoBoardState createState() => _BingoBoardState();
}

class _BingoBoardState extends State<BingoBoard> {
  final Widget Function(BuildContext) _startWidget = (context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 32),
          Image.asset(Paths.confetti),
          SizedBox(height: 32),
          Text(
            Strings.start,
            style: TextStyle(color: Colors.grey[800], fontSize: 32),
          ),
          SizedBox(height: 64),
          SizedBox(
              height: 64,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: RaisedButton(
                    color: Colors.orange,
                    child: Text(Strings.createCard),
                    onPressed: () => context.read<BingoModel>().create()),
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

    return Column(
      children: [
        Row(children: [
          Column(children: column1),
          Column(children: column2),
          Column(children: column3),
          Column(children: column4),
          Column(children: column5),
        ]),
        BingoBottom(),
      ],
    );
  };

  //最初のBuild時は描画したくないための制御変数
  //2回目以降にChangeNotifierから更新されるのでそれを描画する
  var isFirstBuild = true;

  @override
  Widget build(BuildContext context) {
    print("!!!");
    final squares = context.watch<BingoModel>().squares;

    if (isFirstBuild) {
      isFirstBuild = false;
      return Container();
    }

    return squares.isEmpty ? _startWidget(context) : _boardWidget(squares);
  }
}
