import 'package:hive/hive.dart';

part 'requirements.g.dart';

@HiveType(typeId: 7)
class Requirements {
  @HiveField(0)
  final int strength;
  @HiveField(1)
  final int dexterity;
  @HiveField(2)
  final int focus;
  @HiveField(3)
  final int vitality;
  @HiveField(4)
  final bool maleOnly;
  @HiveField(5)
  final int level;

  const Requirements(
      {required this.strength,
      required this.dexterity,
      required this.focus,
      required this.vitality,
      required this.maleOnly,
      required this.level});
}
