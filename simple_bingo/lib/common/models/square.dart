import 'package:hive/hive.dart';

part 'square.g.dart';

@HiveType(typeId: 1)
class Square extends HiveObject {
  Square(this.isCheck, this.number);

  @HiveField(0)
  bool isCheck;
  @HiveField(1)
  final int number;
}
