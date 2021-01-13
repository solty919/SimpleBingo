import 'package:bingo/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bingo_model.dart';

class BingoTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<BingoModel>();
    return model.squares.isEmpty
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 24),
                model.isBingo()
                    ? Text(
                        "BINGO ✌️",
                        style: TextStyle(fontSize: 32),
                      )
                    : Container(),
                model.reach() == 0
                    ? Text("")
                    : Text("${model.reach()} ${Strings.reach}"),
                SizedBox(height: 24),
              ],
            ),
          );
  }
}
