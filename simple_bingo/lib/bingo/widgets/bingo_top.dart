import 'package:bingo/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bingo_model.dart';

class BingoTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<BingoModel>().squares.isEmpty
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 24),
                Text("1 ${Strings.reach}"),
                SizedBox(height: 24),
              ],
            ),
          );
  }
}
