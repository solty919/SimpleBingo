import 'package:bingo/bingo/bingo_model.dart';
import 'package:bingo/common/models/square.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class BingoButton extends StatelessWidget {
  BingoButton({this.square, this.isCenter = false});
  final Square square;
  final bool isCenter;

  void _onTap(BuildContext context) async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
    context.read<BingoModel>().toggle(square);
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width / 5,
      height: deviceSize.width / 5,
      padding: EdgeInsets.all(1),
      child: Container(
        color: square.isCheck || isCenter
            ? Theme.of(context).toggleableActiveColor
            : Theme.of(context).scaffoldBackgroundColor,
        child: OutlinedButton(
            child: Text(
              isCenter ? "★" : square.number.toString(),
              style: TextStyle(
                  color: square.isCheck || isCenter
                      ? Colors.white
                      : Theme.of(context).toggleableActiveColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onPressed: isCenter ? null : () => _onTap(context)),
      ),
    );
  }
}
