import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/models/item/enum/subtype.dart';
import 'package:hive/hive.dart';

import 'advance_stats_bonus.dart';
import 'enum/equipment_slot.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
class Item {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool stackable;

  @HiveField(4)
  final int armor;

  @HiveField(5)
  final EquipmentSlot equipmentSlot;

  @HiveField(6)
  final int buy;

  @HiveField(7)
  final int sell;

  @HiveField(8)
  final int weight;

  @HiveField(9)
  final int attackSpeed;

  @HiveField(10)
  final SubType subType;

  @HiveField(11)
  final bool noTrade;

  @HiveField(12)
  final AdvanceStats damage;

  @HiveField(13)
  final int fishingDamage;

  @HiveField(14)
  final AdvanceStatsBonus bonusStats;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.stackable,
    required this.armor,
    required this.equipmentSlot,
    required this.buy,
    required this.sell,
    required this.weight,
    required this.attackSpeed,
    required this.subType,
    required this.noTrade,
    required this.damage,
    required this.fishingDamage,
    required this.bonusStats,
  });
}
