import 'package:bingo/common/models/square.dart';
import 'package:hive/hive.dart';

part 'chart.g.dart';

@HiveType(typeId: 0)
class Chart extends HiveObject {
  @HiveField(0)
  List<Square> squares;
}
