import 'package:hive/hive.dart';

part 'equipment_slot.g.dart';

@HiveType(typeId: 3)
enum EquipmentSlot {
  @HiveField(0)
  none,
  @HiveField(1)
  unequipable,
  @HiveField(2)
  mainHand,
  @HiveField(3)
  head,
  @HiveField(4)
  chest,
  @HiveField(5)
  leg,
  @HiveField(6)
  feet,
  @HiveField(7)
  offhand,
  @HiveField(8)
  hands,
  @HiveField(9)
  misc,
  @HiveField(10)
  ring,
  @HiveField(11)
  wrist,
  @HiveField(12)
  neck,
  @HiveField(13)
  hat,
  @HiveField(14)
  top,
  @HiveField(15)
  bottoms,
  @HiveField(16)
  shoes,
  @HiveField(17)
  gloves,
  @HiveField(18)
  companion,
  @HiveField(19)
  saddle,
  @HiveField(20)
  mount
}
