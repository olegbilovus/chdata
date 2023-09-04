import 'package:hive/hive.dart';

part 'mob_opinion.g.dart';

@HiveType(typeId: 1)
enum MobOpinion {
  @HiveField(0)
  friendly,
  @HiveField(1)
  hostile,
  @HiveField(2)
  passive,
  @HiveField(3)
  none
}
