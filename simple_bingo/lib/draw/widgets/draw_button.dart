import 'package:bingo/draw/draw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final empty = context.select((DrawModel model) => model.list.isEmpty);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: SizedBox(
          width: double.infinity,
          height: 52,
          child: RaisedButton(
              onPressed: () {
                if (empty) {
                  context.read<DrawModel>().create();
                } else {
                  context.read<DrawModel>().draw();
                }
              },
              child: empty ? Text("始める") : Text("抽選"))),
    );
  }
}
