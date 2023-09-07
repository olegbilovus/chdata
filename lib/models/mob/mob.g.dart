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
      id: fields[0] as int,
      name: fields[1] as String,
      range: fields[2] as double,
      followRange: fields[3] as int,
      opinion: fields[4] as MobOpinion,
      level: fields[5] as int,
      health: fields[6] as int,
      goldMin: fields[7] as int,
      goldMax: fields[8] as int,
      attack: fields[9] as int,
      defence: fields[10] as int,
      attackSpeed: fields[11] as int,
      energy: fields[12] as int,
      damage: fields[13] as AdvanceStats,
      fishingDamage: fields[14] as int,
      resist: fields[15] as AdvanceStats,
      stars: fields[16] as int,
      attackRange: fields[17] as double,
      missileSpeed: fields[18] as int,
      xp: fields[19] as int,
      physicalEvade: fields[20] as int,
      spellEvade: fields[21] as int,
      moveEvade: fields[22] as int,
      woundEvade: fields[23] as int,
      weakEvade: fields[24] as int,
      mentalEvade: fields[25] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Mob obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.range)
      ..writeByte(3)
      ..write(obj.followRange)
      ..writeByte(4)
      ..write(obj.opinion)
      ..writeByte(5)
      ..write(obj.level)
      ..writeByte(6)
      ..write(obj.health)
      ..writeByte(7)
      ..write(obj.goldMin)
      ..writeByte(8)
      ..write(obj.goldMax)
      ..writeByte(9)
      ..write(obj.attack)
      ..writeByte(10)
      ..write(obj.defence)
      ..writeByte(11)
      ..write(obj.attackSpeed)
      ..writeByte(12)
      ..write(obj.energy)
      ..writeByte(13)
      ..write(obj.damage)
      ..writeByte(14)
      ..write(obj.fishingDamage)
      ..writeByte(15)
      ..write(obj.resist)
      ..writeByte(16)
      ..write(obj.stars)
      ..writeByte(17)
      ..write(obj.attackRange)
      ..writeByte(18)
      ..write(obj.missileSpeed)
      ..writeByte(19)
      ..write(obj.xp)
      ..writeByte(20)
      ..write(obj.physicalEvade)
      ..writeByte(21)
      ..write(obj.spellEvade)
      ..writeByte(22)
      ..write(obj.moveEvade)
      ..writeByte(23)
      ..write(obj.woundEvade)
      ..writeByte(24)
      ..write(obj.weakEvade)
      ..writeByte(25)
      ..write(obj.mentalEvade);
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
