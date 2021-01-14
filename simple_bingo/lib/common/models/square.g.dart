// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'square.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SquareAdapter extends TypeAdapter<Square> {
  @override
  final int typeId = 1;

  @override
  Square read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Square(
      fields[0] as bool,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Square obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isCheck)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SquareAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
