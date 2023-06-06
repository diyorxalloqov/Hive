// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nbuModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NbuModelAdapter extends TypeAdapter<NbuModel> {
  @override
  final int typeId = 0;

  @override
  NbuModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NbuModel(
      title: fields[0] as String?,
      code: fields[1] as String?,
      cbPrice: fields[2] as String?,
      nbuBuyPrice: fields[3] as String?,
      nbuCellPrice: fields[4] as String?,
      date: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NbuModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.cbPrice)
      ..writeByte(3)
      ..write(obj.nbuBuyPrice)
      ..writeByte(4)
      ..write(obj.nbuCellPrice)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NbuModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
