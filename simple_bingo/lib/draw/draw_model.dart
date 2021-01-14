import 'package:bingo/common/keys.dart';
import 'package:bingo/common/models/square.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DrawModel with ChangeNotifier {
  var list = <Square>[];

  void draw() {
    final Square square = list.firstWhere((square) => !square.isCheck);
    square.isCheck = !square.isCheck;
    notifyListeners();
  }

  void create() async {
    //75は含まないメソッドなので+1して0~74を1~75にする
    final squares =
        List<Square>.generate(75, (index) => Square(false, index + 1));
    squares.shuffle();

    Box<List<Square>> box = await Hive.openBox<List<Square>>(Keys.draw);
    box.put(Keys.draw, squares);
    fetch();
  }

  void fetch() async {
    Box<List<Square>> box = await Hive.openBox<List<Square>>(Keys.draw);
    List<Square> squares = box.get(Keys.draw);
    list = squares ?? <Square>[];
    notifyListeners();
  }
}
