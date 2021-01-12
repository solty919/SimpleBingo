import 'package:bingo/bingo/models/models.dart';
import 'package:bingo/common/keys.dart';
import 'package:bingo/common/number_generator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BingoModel with ChangeNotifier {
  final squares = <Square>[];

  /// BINGOカードに数値を振る
  void create() async {
    Box<Chart> box = await Hive.openBox<Chart>(Keys.db);
    Chart chart = Chart()
      ..squares = NumberGenerator()
          .bingoNumbers()
          .map((e) => Square(false, e))
          .toList();
    box.put(Keys.chart, chart);
    fetch();
  }

  /// 前回保存データから値を取得する
  void fetch() async {
    Box<Chart> box = await Hive.openBox<Chart>(Keys.db);
    Chart chart = box.get(Keys.chart);
    squares.clear();
    squares.addAll(chart?.squares ?? <Square>[]);
    notifyListeners();
  }

  /// チェックを反転させる
  void toggle(Square square) {
    square.isCheck = !square.isCheck;
    notifyListeners();
  }
}
