import 'package:chdata/models/advance_stats.dart';
import 'package:hive/hive.dart';

part 'advance_stats_bonus.g.dart';

@HiveType(typeId: 6)
class AdvanceStatsBonus extends AdvanceStats {
  @HiveField(10)
  final int attack;
  @HiveField(11)
  final int defence;
  @HiveField(12)
  final int health;
  @HiveField(13)
  final int energy;
  @HiveField(14)
  final int fishingResist;
  @HiveField(15)
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
}
