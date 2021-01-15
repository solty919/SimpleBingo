import 'package:bingo/common/models/square.dart';
import 'package:hive/hive.dart';

part 'drawn.g.dart';

@HiveType(typeId: 2)
class Drawn extends HiveObject {
  Drawn(this.squares);

  @HiveField(0)
  final List<Square> squares;
}
