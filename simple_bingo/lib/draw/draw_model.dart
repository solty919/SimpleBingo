import 'package:bingo/common/keys.dart';
import 'package:bingo/common/models/square.dart';
import 'package:bingo/draw/models/drawn.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DrawModel with ChangeNotifier {
  var _list = <Square>[];

  List<Square> get list {
    final copy = _list.toList();
    copy.sort((a, b) => a.number.compareTo(b.number));
    return copy;
  }

  int get selected {
    return _list
        .lastWhere((square) => square.isCheck, orElse: () => null)
        ?.number;
  }

  void draw() async {
    try {
      final Square square = _list.firstWhere((square) => !square.isCheck);
      square.isCheck = !square.isCheck;
      Box<Drawn> box = await Hive.openBox<Drawn>(Keys.draw);
      box.put(Keys.draw, Drawn(_list.toList()));
      print(_list.map((e) => e.isCheck));
      notifyListeners();
    } catch (e) {
      return;
    }
  }

  void create() async {
    //75は含まないメソッドなので+1して0~74を1~75にする
    final squares =
        List<Square>.generate(75, (index) => Square(false, index + 1));
    squares.shuffle();

    Box<Drawn> box = await Hive.openBox<Drawn>(Keys.draw);
    box.put(Keys.draw, Drawn(squares));
    fetch();
  }

  void fetch() async {
    Box<Drawn> box = await Hive.openBox<Drawn>(Keys.draw);
    List<Square> squares = box.get(Keys.draw)?.squares;
    if (squares == null) {
      create();
      return;
    } else {
      _list = squares;
      notifyListeners();
    }
  }
}
