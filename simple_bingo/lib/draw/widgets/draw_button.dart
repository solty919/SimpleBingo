import 'package:flutter/material.dart';

class DrawButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: SizedBox(
          width: double.infinity,
          height: 52,
          child: RaisedButton(onPressed: () {}, child: Text("!"))),
    );
  }
}
