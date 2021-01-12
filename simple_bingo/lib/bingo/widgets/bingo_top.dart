import 'package:bingo/common/strings.dart';
import 'package:flutter/material.dart';

class BingoTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text("1 ${Strings.reach}"),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
