// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advance_stats_bonus.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdvanceStatsBonusAdapter extends TypeAdapter<AdvanceStatsBonus> {
  @override
  final int typeId = 6;

  @override
  AdvanceStatsBonus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdvanceStatsBonus(
      pierce: fields[0] as int,
      slash: fields[1] as int,
      crush: fields[2] as int,
      heat: fields[3] as int,
      cold: fields[4] as int,
      magic: fields[5] as int,
      poison: fields[6] as int,
      divine: fields[7] as int,
      chaos: fields[8] as int,
      truee: fields[9] as int,
      attack: fields[10] as int,
      defence: fields[11] as int,
      health: fields[12] as int,
      energy: fields[13] as int,
      fishingResist: fields[14] as int,
      concentration: fields[15] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AdvanceStatsBonus obj) {
    writer
      ..writeByte(16)
      ..writeByte(10)
      ..write(obj.attack)
      ..writeByte(11)
      ..write(obj.defence)
      ..writeByte(12)
      ..write(obj.health)
      ..writeByte(13)
      ..write(obj.energy)
      ..writeByte(14)
      ..write(obj.fishingResist)
      ..writeByte(15)
      ..write(obj.concentration)
      ..writeByte(0)
      ..write(obj.pierce)
      ..writeByte(1)
      ..write(obj.slash)
      ..writeByte(2)
      ..write(obj.crush)
      ..writeByte(3)
      ..write(obj.heat)
      ..writeByte(4)
      ..write(obj.cold)
      ..writeByte(5)
      ..write(obj.magic)
      ..writeByte(6)
      ..write(obj.poison)
      ..writeByte(7)
      ..write(obj.divine)
      ..writeByte(8)
      ..write(obj.chaos)
      ..writeByte(9)
      ..write(obj.truee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvanceStatsBonusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
