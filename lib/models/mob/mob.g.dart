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
      pierceDamage: fields[13] as int,
      slashDamage: fields[14] as int,
      crushDamage: fields[15] as int,
      heatDamage: fields[16] as int,
      coldDamage: fields[17] as int,
      magicDamage: fields[18] as int,
      poisonDamage: fields[19] as int,
      divineDamage: fields[20] as int,
      chaosDamage: fields[21] as int,
      trueDamage: fields[22] as int,
      fishingDamage: fields[23] as int,
      pierceResist: fields[24] as int,
      slashResist: fields[25] as int,
      crushResist: fields[26] as int,
      heatResist: fields[27] as int,
      coldResist: fields[28] as int,
      magicResist: fields[29] as int,
      poisonResist: fields[30] as int,
      divineResist: fields[31] as int,
      chaosResist: fields[32] as int,
      trueResist: fields[33] as int,
      stars: fields[34] as int,
      attackRange: fields[35] as double,
      missileSpeed: fields[36] as int,
      xp: fields[37] as int,
      physicalEvade: fields[38] as int,
      spellEvade: fields[39] as int,
      moveEvade: fields[40] as int,
      woundEvade: fields[41] as int,
      weakEvade: fields[42] as int,
      mentalEvade: fields[43] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Mob obj) {
    writer
      ..writeByte(44)
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
      ..write(obj.pierceDamage)
      ..writeByte(14)
      ..write(obj.slashDamage)
      ..writeByte(15)
      ..write(obj.crushDamage)
      ..writeByte(16)
      ..write(obj.heatDamage)
      ..writeByte(17)
      ..write(obj.coldDamage)
      ..writeByte(18)
      ..write(obj.magicDamage)
      ..writeByte(19)
      ..write(obj.poisonDamage)
      ..writeByte(20)
      ..write(obj.divineDamage)
      ..writeByte(21)
      ..write(obj.chaosDamage)
      ..writeByte(22)
      ..write(obj.trueDamage)
      ..writeByte(23)
      ..write(obj.fishingDamage)
      ..writeByte(24)
      ..write(obj.pierceResist)
      ..writeByte(25)
      ..write(obj.slashResist)
      ..writeByte(26)
      ..write(obj.crushResist)
      ..writeByte(27)
      ..write(obj.heatResist)
      ..writeByte(28)
      ..write(obj.coldResist)
      ..writeByte(29)
      ..write(obj.magicResist)
      ..writeByte(30)
      ..write(obj.poisonResist)
      ..writeByte(31)
      ..write(obj.divineResist)
      ..writeByte(32)
      ..write(obj.chaosResist)
      ..writeByte(33)
      ..write(obj.trueResist)
      ..writeByte(34)
      ..write(obj.stars)
      ..writeByte(35)
      ..write(obj.attackRange)
      ..writeByte(36)
      ..write(obj.missileSpeed)
      ..writeByte(37)
      ..write(obj.xp)
      ..writeByte(38)
      ..write(obj.physicalEvade)
      ..writeByte(39)
      ..write(obj.spellEvade)
      ..writeByte(40)
      ..write(obj.moveEvade)
      ..writeByte(41)
      ..write(obj.woundEvade)
      ..writeByte(42)
      ..write(obj.weakEvade)
      ..writeByte(43)
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
