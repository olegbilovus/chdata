// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requirements.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequirementsAdapter extends TypeAdapter<Requirements> {
  @override
  final int typeId = 7;

  @override
  Requirements read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Requirements(
      strength: fields[0] as int,
      dexterity: fields[1] as int,
      focus: fields[2] as int,
      vitality: fields[3] as int,
      maleOnly: fields[4] as bool,
      level: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Requirements obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.strength)
      ..writeByte(1)
      ..write(obj.dexterity)
      ..writeByte(2)
      ..write(obj.focus)
      ..writeByte(3)
      ..write(obj.vitality)
      ..writeByte(4)
      ..write(obj.maleOnly)
      ..writeByte(5)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequirementsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
