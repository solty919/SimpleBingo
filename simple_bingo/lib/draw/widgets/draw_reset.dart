import 'package:bingo/common/strings.dart';
import 'package:bingo/draw/draw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reset extends StatelessWidget {
  void _onTap(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(Strings.recreateDraw),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(Strings.cancel)),
              FlatButton(
                  onPressed: () {
                    context.read<DrawModel>().create();
                    Navigator.pop(context);
                  },
                  child: Text(Strings.ok))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton.icon(
            icon: Icon(
              Icons.refresh,
              color: Colors.orange,
            ),
            label: Text(
              Strings.reset,
              style: TextStyle(color: Colors.orange),
            ),
            onPressed: () => _onTap(context),
          ),
        ],
      ),
    );
  }
}
