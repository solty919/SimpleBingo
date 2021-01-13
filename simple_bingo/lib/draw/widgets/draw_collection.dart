import 'package:flutter/material.dart';

class DrawCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = List.filled(75, 50);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: GridView.builder(
            shrinkWrap: true, //Scrollを入れ子にするため
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
                      list[index].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
