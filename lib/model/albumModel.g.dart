// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumModelAdapter extends TypeAdapter<AlbumModel> {
  @override
  final int typeId = 1;

  @override
  AlbumModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumModel(
      albumId: fields[0] as int?,
      id: fields[1] as int?,
      title: fields[2] as String?,
      url: fields[3] as String?,
      thumbnailUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.albumId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.thumbnailUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
