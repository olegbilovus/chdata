import 'package:hive/hive.dart';

part 'class.g.dart';

@HiveType(typeId: 8)
enum Class {
  @HiveField(0)
  warrior,
  @HiveField(1)
  druid,
  @HiveField(2)
  mage,
  @HiveField(3)
  ranger,
  @HiveField(4)
  rogue
}
