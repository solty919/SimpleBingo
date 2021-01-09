import 'package:bingo/common/paths.dart';
import 'package:flutter/material.dart';

class BingoTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("eee"),
          Image.asset(Paths.bingo, width: 32, height: 32)
        ],
      ),
    );
  }
}
