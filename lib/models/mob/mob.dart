import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/models/mob/spawn.dart';
import 'package:chdata/models/model.dart';

import 'enum/mob_opinion.dart';

class Mob implements Model {
  @override
  final int id;
  @override
  final String name;
  final double range;
  final int followRange;
  final MobOpinion opinion;
  final int level;
  final int health;
  final int goldMin;
  final int goldMax;
  final int attack;
  final int defence;
  final int attackSpeed;
  final int energy;
  final AdvanceStats damage;
  final int fishingDamage;
  final AdvanceStats resist;
  final int stars;
  final double attackRange;
  final int missileSpeed;
  final int xp;
  final int physicalEvade;
  final int spellEvade;
  final int moveEvade;
  final int woundEvade;
  final int weakEvade;
  final int mentalEvade;
  final List<Spawn> spawns;
  final List<String> drops;

  const Mob(
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
      required this.mentalEvade,
      required this.spawns,
      required this.drops});

  Mob.fromJson(Map<String, dynamic> json)
      : id = json[mobIdField] as int,
        name = json[mobNameField] as String,
        range = json[mobRangeField] as double,
        followRange = json[mobFollowRangeField] as int,
        opinion = MobOpinion.values.byName(json[mobOpinionField]),
        level = json[mobLevelField] as int,
        health = json[mobHealthField] as int,
        goldMin = json[mobGoldMinField] as int,
        goldMax = json[mobGoldMaxField] as int,
        attack = json[mobAttackField] as int,
        defence = json[mobDefenceField] as int,
        attackSpeed = json[mobAttackSpeedField] as int,
        energy = json[mobEnergyField] as int,
        damage = AdvanceStats.fromJson(json[mobDamageField]),
        fishingDamage = json[mobFishingDamageField] as int,
        resist = AdvanceStats.fromJson(json[mobResistField]),
        stars = json[mobStarsField] as int,
        attackRange = json[mobAttackRangeField] as double,
        missileSpeed = json[mobMissileSpeedField] as int,
        xp = json[mobXpField] as int,
        physicalEvade = json[mobPhysicalEvadeField] as int,
        spellEvade = json[mobSpellEvadeField] as int,
        moveEvade = json[mobMoveEvadeField] as int,
        woundEvade = json[mobWoundEvadeField] as int,
        weakEvade = json[mobWeakEvadeField] as int,
        mentalEvade = json[mobMentalEvadeField] as int,
        spawns = List<Spawn>.from(
            json[mobSpawnsField].map((e) => Spawn.fromJson(e))),
        drops = List<String>.from(json[mobDropsField]);

  @override
  Mob fromJson(Map<String, dynamic> json) => Mob.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        mobIdField: id,
        mobNameField: name,
        mobRangeField: range,
        mobFollowRangeField: followRange,
        mobOpinionField: opinion.name,
        mobLevelField: level,
        mobHealthField: health,
        mobGoldMinField: goldMin,
        mobGoldMaxField: goldMax,
        mobAttackField: attack,
        mobDefenceField: defence,
        mobAttackSpeedField: attackSpeed,
        mobEnergyField: energy,
        mobDamageField: damage.toJson(),
        mobFishingDamageField: fishingDamage,
        mobResistField: resist.toJson(),
        mobStarsField: stars,
        mobAttackRangeField: attackRange,
        mobMissileSpeedField: missileSpeed,
        mobXpField: xp,
        mobPhysicalEvadeField: physicalEvade,
        mobSpellEvadeField: spellEvade,
        mobMoveEvadeField: moveEvade,
        mobWoundEvadeField: woundEvade,
        mobWeakEvadeField: weakEvade,
        mobMentalEvadeField: mentalEvade,
        mobSpawnsField: spawns.map((e) => e.toJson()).toList(),
        mobDropsField: drops
      };
}

const mobIdField = 'id';
const mobNameField = 'name';
const mobRangeField = 'range';
const mobFollowRangeField = 'followRange';
const mobOpinionField = 'opinion';
const mobLevelField = 'level';
const mobHealthField = 'health';
const mobGoldMinField = 'goldMin';
const mobGoldMaxField = 'goldMax';
const mobAttackField = 'attack';
const mobDefenceField = 'defence';
const mobAttackSpeedField = 'attackSpeed';
const mobEnergyField = 'energy';
const mobDamageField = 'damage';
const mobFishingDamageField = 'fishingDamage';
const mobResistField = 'resist';
const mobStarsField = 'stars';
const mobAttackRangeField = 'AttackRange';
const mobMissileSpeedField = 'missileSpeed';
const mobXpField = 'xp';
const mobPhysicalEvadeField = 'physicalEvade';
const mobSpellEvadeField = 'spellEvade';
const mobMoveEvadeField = 'moveEvade';
const mobWoundEvadeField = 'woundEvade';
const mobWeakEvadeField = 'weakEvade';
const mobMentalEvadeField = 'mentalEvade';
const mobSpawnsField = 'spawns';
const mobDropsField = 'drops';
