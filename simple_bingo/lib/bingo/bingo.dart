import 'package:bingo/bingo/bingo_model.dart';
import 'package:bingo/bingo/widgets/bingo_board.dart';
import 'package:bingo/bingo/widgets/bingo_top.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bingo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BingoModel(),
      child: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    context.read<BingoModel>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [BingoTop(), BingoBoard()],
    );
  }
}
