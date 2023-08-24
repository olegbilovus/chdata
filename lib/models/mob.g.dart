// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MobAdapter extends TypeAdapter<Mob> {
  @override
  final int typeId = 0;

  @override
  Mob read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mob(
      name: fields[0] as String,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Mob obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
