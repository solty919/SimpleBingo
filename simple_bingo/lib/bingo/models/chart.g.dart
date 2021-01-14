// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChartAdapter extends TypeAdapter<Chart> {
  @override
  final int typeId = 0;

  @override
  Chart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chart()..squares = (fields[0] as List)?.cast<Square>();
  }

  @override
  void write(BinaryWriter writer, Chart obj) {
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
      other is ChartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
