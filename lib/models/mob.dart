import 'package:hive/hive.dart';
part 'mob.g.dart';

@HiveType(typeId: 0)
class Mob {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int id;

  const Mob({required this.name, required this.id});
}
