import 'package:bingo/common/number_generator.dart';
import 'package:flutter/material.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = NumberGenerator().uniques(1, 3);
    print(list);
    return Container();
  }
}
