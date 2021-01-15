import 'package:bingo/draw/draw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final number = context.select((DrawModel model) => model.selected);
    return Text(number?.toString() ?? "", style: TextStyle(fontSize: 128));
  }
}
