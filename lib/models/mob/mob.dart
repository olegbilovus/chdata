import 'package:chdata/models/advance_stats.dart';
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
  final AdvanceStats damage;

  @HiveField(14)
  final int fishingDamage;

  @HiveField(15)
  final AdvanceStats resist;

  @HiveField(16)
  final int stars;

  @HiveField(17)
  final double attackRange;

  @HiveField(18)
  final int missileSpeed;

  @HiveField(19)
  final int xp;

  @HiveField(20)
  final int physicalEvade;

  @HiveField(21)
  final int spellEvade;

  @HiveField(22)
  final int moveEvade;

  @HiveField(23)
  final int woundEvade;

  @HiveField(24)
  final int weakEvade;

  @HiveField(25)
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
      required this.damage,
      required this.fishingDamage,
      required this.resist,
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
