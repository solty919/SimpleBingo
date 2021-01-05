import 'package:bingo/bingo/bingo_model.dart';
import 'package:bingo/bingo/widgets/bingo_board.dart';
import 'package:bingo/bingo/widgets/bingo_top.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bingo extends StatelessWidget {
  final _bingoTop = BingoTop();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BingoModel(),
      child: SingleChildScrollView(
        child: Column(
          children: [_bingoTop, BingoBoard(), _TestButton()],
        ),
      ),
    );
  }
}

class _TestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("Test"),
        onPressed: () {
          context.read<BingoModel>().add();
        });
  }
}
