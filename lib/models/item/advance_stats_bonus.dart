import 'package:chdata/models/advance_stats.dart';

class AdvanceStatsBonus extends AdvanceStats {
  final int attack;
  final int defence;
  final int health;
  final int energy;
  final int fishingResist;
  final int concentration;

  const AdvanceStatsBonus(
      {required super.pierce,
      required super.slash,
      required super.crush,
      required super.heat,
      required super.cold,
      required super.magic,
      required super.poison,
      required super.divine,
      required super.chaos,
      required super.truee,
      required this.attack,
      required this.defence,
      required this.health,
      required this.energy,
      required this.fishingResist,
      required this.concentration});

  @override
  factory AdvanceStatsBonus.fromJson(Map<String, dynamic> json) {
    final advanceStats = AdvanceStats.fromJson(json);

    return AdvanceStatsBonus(
        pierce: advanceStats.pierce,
        slash: advanceStats.slash,
        crush: advanceStats.crush,
        heat: advanceStats.heat,
        cold: advanceStats.cold,
        magic: advanceStats.magic,
        poison: advanceStats.poison,
        divine: advanceStats.divine,
        chaos: advanceStats.chaos,
        truee: advanceStats.truee,
        attack: json[advanceStatsBonusAttackField] as int,
        defence: json[advanceStatsBonusDefenceField] as int,
        health: json[advanceStatsBonusHealthField] as int,
        energy: json[advanceStatsBonusEnergyField] as int,
        fishingResist: json[advanceStatsBonusFishingResistField] as int,
        concentration: json[advanceStatsBonusConcentrationField] as int);
  }

  @override
  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      advanceStatsBonusAttackField: attack,
      advanceStatsBonusDefenceField: defence,
      advanceStatsBonusHealthField: health,
      advanceStatsBonusEnergyField: energy,
      advanceStatsBonusFishingResistField: fishingResist,
      advanceStatsBonusConcentrationField: concentration
    };
    json.addAll(super.toJson());
    return json;
  }
}

const advanceStatsBonusAttackField = 'attack';
const advanceStatsBonusDefenceField = 'defence';
const advanceStatsBonusHealthField = 'health';
const advanceStatsBonusEnergyField = 'energy';
const advanceStatsBonusFishingResistField = 'fishingResist';
const advanceStatsBonusConcentrationField = 'concentration';
