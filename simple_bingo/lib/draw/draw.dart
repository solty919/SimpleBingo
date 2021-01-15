import 'package:bingo/draw/draw_model.dart';
import 'package:bingo/draw/widgets/draw_button.dart';
import 'package:bingo/draw/widgets/draw_collection.dart';
import 'package:bingo/draw/widgets/draw_reset.dart';
import 'package:bingo/draw/widgets/draw_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DrawModel(),
      child: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    context.read<DrawModel>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [DrawTitle(), DrawButton(), DrawCollection(), Reset()],
      ),
    );
  }
}
