import 'package:flutter/material.dart';

class DrawCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = List.filled(75, 50);

    return GridView.builder(
        shrinkWrap: true, //高さを自動決定
        physics: NeverScrollableScrollPhysics(), //スクロール不可に
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).textTheme.headline6.color),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  list.elementAt(index).toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        });
  }
}
