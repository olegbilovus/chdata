// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone_map.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZoneMapAdapter extends TypeAdapter<ZoneMap> {
  @override
  final int typeId = 8;

  @override
  ZoneMap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZoneMap(
      id: fields[0] as int,
      name: fields[1] as String,
      assetName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ZoneMap obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.assetName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZoneMapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
