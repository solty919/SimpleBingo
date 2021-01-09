import 'package:bingo/bingo/bingo_model.dart';
import 'package:bingo/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BingoBottom extends StatelessWidget {
  void _onTap(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(Strings.recreateCard),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(Strings.cancel)),
              FlatButton(
                  onPressed: () {
                    context.read<BingoModel>().create();
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
        children: [
          FlatButton.icon(
            icon: Icon(
              Icons.refresh,
              color: Colors.orange,
            ),
            label: Text(
              Strings.numbering,
              style: TextStyle(color: Colors.orange),
            ),
            onPressed: () => _onTap(context),
          ),
        ],
      ),
    );
  }
}
