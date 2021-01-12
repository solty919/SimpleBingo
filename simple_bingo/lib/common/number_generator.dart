import 'dart:math' as math;

class NumberGenerator {
  List<int> bingoNumbers() {
    return List<int>()
      ..addAll(uniques(1, 15))
      ..addAll(uniques(16, 30))
      ..addAll(uniques(31, 45))
      ..addAll(uniques(46, 60))
      ..addAll(uniques(61, 75));
  }

  /// 引数にとった最小値から最大値までの乱数を5つ生成しListにして返却する
  /// 意図しない引数を受け取った場合全ての要素が0の配列を返却
  /// exp uniques(min: 1, max: 10) -> [1, 3, 5, 7, 10]
  List<int> uniques(int min, int max) {
    final list = <int>[];
    int count = 0;

    if (min > max || min < 0 || max < 0) return List.filled(5, 0);

    while (list.length != 5) {
      count++;
      if (count == 1000) return List.filled(5, 0);

      final random = min + math.Random().nextInt(max + 1 - min);
      if (!list.contains(random)) {
        list.add(random);
      }
    }

    return list;
  }
}
