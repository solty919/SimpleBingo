import 'package:bingo/bingo/models/chart.dart';
import 'package:bingo/common/keys.dart';
import 'package:bingo/common/models/square.dart';
import 'package:bingo/common/number_generator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BingoModel with ChangeNotifier {
  List<Square> squares;

  /// BINGOカードに数値を振る
  void create() async {
    Chart chart = Chart()
      ..squares = NumberGenerator()
          .bingoNumbers()
          .map((e) => Square(false, e))
          .toList();

    Box<Chart> box = await Hive.openBox<Chart>(Keys.db);
    box.put(Keys.chart, chart);
    fetch();
  }

  /// 前回保存データから値を取得する
  void fetch() async {
    Box<Chart> box = await Hive.openBox<Chart>(Keys.db);
    Chart chart = box.get(Keys.chart);
    squares = chart?.squares ?? <Square>[];
    notifyListeners();
  }

  /// チェックを反転させる
  void toggle(Square square) async {
    square.isCheck = !square.isCheck;
    Box<Chart> box = await Hive.openBox<Chart>(Keys.db);
    box.put(Keys.chart, Chart()..squares = squares);
    notifyListeners();
  }

  ///リーチが何個あるか数える
  int reach() {
    return _check(_Type.Reach);
  }

  ///ビンゴしているかを判定
  bool get isBingo {
    final int count = _check(_Type.Bingo);
    return count > 0;
  }

  int _check(_Type type) {
    if (squares == null || squares.length != 25) {
      return 0;
    }

    int checkLength;
    switch (type) {
      case _Type.Reach:
        checkLength = 1;
        break;
      case _Type.Bingo:
        checkLength = 0;
        break;
    }

    // [ | ]方向
    // DartのsubListはendを含まない
    final List<bool> results1 = [
      squares.sublist(0, 5),
      squares.sublist(5, 10),
      squares.sublist(10, 15),
      squares.sublist(15, 20),
      squares.sublist(20, 25)
    ]
        .map((subList) =>
            subList.where((element) => !element.isCheck).length == checkLength)
        .toList();

    // [ - ]方向
    final List<bool> results2 = [
      [squares[0], squares[5], squares[10], squares[15], squares[20]],
      [squares[1], squares[6], squares[11], squares[16], squares[21]],
      [squares[2], squares[7], squares[12], squares[17], squares[22]],
      [squares[3], squares[8], squares[13], squares[18], squares[23]],
      [squares[4], squares[9], squares[14], squares[19], squares[24]],
    ]
        .map((subList) =>
            subList.where((element) => !element.isCheck).length == checkLength)
        .toList();

    // [ / ]方向
    final List<bool> results3 = [
      [squares[4], squares[8], squares[12], squares[16], squares[20]],
    ]
        .map((subList) =>
            subList.where((element) => !element.isCheck).length == checkLength)
        .toList();

    // [ \ ]方向
    final List<bool> results4 = [
      [squares[0], squares[6], squares[12], squares[18], squares[24]],
    ]
        .map((subList) =>
            subList.where((element) => !element.isCheck).length == checkLength)
        .toList();

    final count = results1.where((element) => element).length +
        results2.where((element) => element).length +
        results3.where((element) => element).length +
        results4.where((element) => element).length;

    return count;
  }
}

enum _Type {
  Reach,
  Bingo,
}
