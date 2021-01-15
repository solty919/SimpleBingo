import 'package:bingo/draw/draw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true, //高さを自動決定
        physics: NeverScrollableScrollPhysics(), //スクロール不可に
        itemCount: context.select<DrawModel, int>((model) => model.list.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) {
          return Builder(builder: (context) {
            final isCheck = context.select(
                (DrawModel model) => model.list.elementAt(index).isCheck);
            final number = context.select(
                (DrawModel model) => model.list.elementAt(index).number);
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    border: isCheck
                        ? Border.all(
                            color: Theme.of(context).buttonColor, width: 2)
                        : null,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    number.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          });
        });
  }
}
