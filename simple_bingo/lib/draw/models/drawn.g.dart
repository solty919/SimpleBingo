// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawn.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrawnAdapter extends TypeAdapter<Drawn> {
  @override
  final int typeId = 2;

  @override
  Drawn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Drawn(
      (fields[0] as List)?.cast<Square>(),
    );
  }

  @override
  void write(BinaryWriter writer, Drawn obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.squares);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawnAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
