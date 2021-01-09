import 'package:bingo/bingo/models/models.dart';
import 'package:bingo/common/keys.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BingoModel with ChangeNotifier {
  final squares = <Square>[];

  //BINGOカードに数値を振る
  void create() async {
    Box<Chart> box = await Hive.openBox<Chart>(Keys.db);
    Chart chart = Chart()..squares = List.filled(25, Square(false, 20));
    box.put(Keys.chart, chart);
    fetch();
  }

  void fetch() async {
    Box<Chart> box = await Hive.openBox<Chart>(Keys.db);
    Chart chart = box.get(Keys.chart);
    squares.clear();
    squares.addAll(chart?.squares ?? <Square>[]);
    notifyListeners();
  }

  void toggle(Square square) {
    square.isCheck = !square.isCheck;
    notifyListeners();
  }
}
