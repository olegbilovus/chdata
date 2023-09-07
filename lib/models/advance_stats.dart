import 'package:hive/hive.dart';

part 'advance_stats.g.dart';

@HiveType(typeId: 5)
class AdvanceStats {
  @HiveField(0)
  final int pierce;

  @HiveField(1)
  final int slash;

  @HiveField(2)
  final int crush;

  @HiveField(3)
  final int heat;

  @HiveField(4)
  final int cold;

  @HiveField(5)
  final int magic;

  @HiveField(6)
  final int poison;

  @HiveField(7)
  final int divine;

  @HiveField(8)
  final int chaos;

  @HiveField(9)
  final int truee;

  const AdvanceStats(
      {required this.pierce,
      required this.slash,
      required this.crush,
      required this.heat,
      required this.cold,
      required this.magic,
      required this.poison,
      required this.divine,
      required this.chaos,
      required this.truee});
}
