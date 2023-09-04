import 'package:hive/hive.dart';

import 'enum/mob_opinion.dart';

part 'mob.g.dart';

@HiveType(typeId: 0)
class Mob {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double range;

  @HiveField(3)
  final int followRange;

  @HiveField(4)
  final MobOpinion opinion;

  @HiveField(5)
  final int level;

  @HiveField(6)
  final int health;

  @HiveField(7)
  final int goldMin;

  @HiveField(8)
  final int goldMax;

  @HiveField(9)
  final int attack;

  @HiveField(10)
  final int defence;

  @HiveField(11)
  final int attackSpeed;

  @HiveField(12)
  final int energy;

  @HiveField(13)
  final int pierceDamage;

  @HiveField(14)
  final int slashDamage;

  @HiveField(15)
  final int crushDamage;

  @HiveField(16)
  final int heatDamage;

  @HiveField(17)
  final int coldDamage;

  @HiveField(18)
  final int magicDamage;

  @HiveField(19)
  final int poisonDamage;

  @HiveField(20)
  final int divineDamage;

  @HiveField(21)
  final int chaosDamage;

  @HiveField(22)
  final int trueDamage;

  @HiveField(23)
  final int fishingDamage;

  @HiveField(24)
  final int pierceResist;

  @HiveField(25)
  final int slashResist;

  @HiveField(26)
  final int crushResist;

  @HiveField(27)
  final int heatResist;

  @HiveField(28)
  final int coldResist;

  @HiveField(29)
  final int magicResist;

  @HiveField(30)
  final int poisonResist;

  @HiveField(31)
  final int divineResist;

  @HiveField(32)
  final int chaosResist;

  @HiveField(33)
  final int trueResist;

  @HiveField(34)
  final int stars;

  @HiveField(35)
  final double attackRange;

  @HiveField(36)
  final int missileSpeed;

  @HiveField(37)
  final int xp;

  @HiveField(38)
  final int physicalEvade;

  @HiveField(39)
  final int spellEvade;

  @HiveField(40)
  final int moveEvade;

  @HiveField(41)
  final int woundEvade;

  @HiveField(42)
  final int weakEvade;

  @HiveField(43)
  final int mentalEvade;

  Mob(
      {required this.id,
      required this.name,
      required this.range,
      required this.followRange,
      required this.opinion,
      required this.level,
      required this.health,
      required this.goldMin,
      required this.goldMax,
      required this.attack,
      required this.defence,
      required this.attackSpeed,
      required this.energy,
      required this.pierceDamage,
      required this.slashDamage,
      required this.crushDamage,
      required this.heatDamage,
      required this.coldDamage,
      required this.magicDamage,
      required this.poisonDamage,
      required this.divineDamage,
      required this.chaosDamage,
      required this.trueDamage,
      required this.fishingDamage,
      required this.pierceResist,
      required this.slashResist,
      required this.crushResist,
      required this.heatResist,
      required this.coldResist,
      required this.magicResist,
      required this.poisonResist,
      required this.divineResist,
      required this.chaosResist,
      required this.trueResist,
      required this.stars,
      required this.attackRange,
      required this.missileSpeed,
      required this.xp,
      required this.physicalEvade,
      required this.spellEvade,
      required this.moveEvade,
      required this.woundEvade,
      required this.weakEvade,
      required this.mentalEvade});
}
