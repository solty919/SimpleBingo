import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class Chart extends HiveObject {
  @HiveField(0)
  List<Square> squares;
}

@HiveType(typeId: 1)
class Square extends HiveObject {
  Square(this.isCheck, this.number);

  @HiveField(0)
  bool isCheck;
  @HiveField(1)
  final int number;
}
