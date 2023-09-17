import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/models/item/enum/class.dart';
import 'package:chdata/models/item/enum/subtype.dart';
import 'package:chdata/models/item/requirements.dart';
import 'package:chdata/models/model.dart';

import 'advance_stats_bonus.dart';
import 'enum/equipment_slot.dart';

class Item implements Model {
  @override
  final int id;
  @override
  final String name;
  final String description;
  final bool stackable;
  final int armor;
  final EquipmentSlot equipmentSlot;
  final int buy;
  final int sell;
  final int weight;
  final int attackSpeed;
  final SubType subType;
  final bool noTrade;
  final AdvanceStats damage;
  final int fishingDamage;
  final AdvanceStatsBonus bonusStats;
  final Requirements requirements;
  final Class clasz;

  const Item(
      {required this.id,
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
      required this.requirements,
      required this.clasz});

  Item.fromJson(Map<String, dynamic> json)
      : id = json[itemIdField] as int,
        name = json[itemNameField] as String,
        description = json[itemDescriptionField] as String,
        stackable = json[itemStackableField] as bool,
        armor = json[itemArmorField] as int,
        equipmentSlot =
            EquipmentSlot.values.byName(json[itemEquipmentSlotField]),
        buy = json[itemBuyField] as int,
        sell = json[itemSellField] as int,
        weight = json[itemWeightField] as int,
        attackSpeed = json[itemAttackSpeedField] as int,
        subType = SubType.values.byName(json[itemSubTypeField]),
        noTrade = json[itemNoTradeField] as bool,
        damage = AdvanceStats.fromJson(json[itemDamageField]),
        fishingDamage = json[itemFishingDamageField] as int,
        bonusStats = AdvanceStatsBonus.fromJson(json[itemBonusStatsField]),
        requirements = Requirements.fromJson(json[itemRequirementsField]),
        clasz = Class.values.byName(json[itemClaszField]);

  @override
  Item fromJson(Map<String, dynamic> json) => Item.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        itemIdField: id,
        itemNameField: name,
        itemDescriptionField: description,
        itemStackableField: stackable,
        itemArmorField: armor,
        itemEquipmentSlotField: equipmentSlot.name,
        itemBuyField: buy,
        itemSellField: sell,
        itemWeightField: weight,
        itemAttackSpeedField: attackSpeed,
        itemSubTypeField: subType.name,
        itemNoTradeField: noTrade,
        itemDamageField: damage.toJson(),
        itemFishingDamageField: fishingDamage,
        itemBonusStatsField: bonusStats.toJson(),
        itemRequirementsField: requirements.toJson(),
        itemClaszField: clasz.name
      };
}

const itemIdField = 'id';
const itemNameField = 'name';
const itemDescriptionField = 'description';
const itemStackableField = 'stackable';
const itemArmorField = 'armor';
const itemEquipmentSlotField = 'equipmentSlot';
const itemBuyField = 'buy';
const itemSellField = 'sell';
const itemWeightField = 'weight';
const itemAttackSpeedField = 'attackSpeed';
const itemSubTypeField = 'subType';
const itemNoTradeField = 'noTrade';
const itemDamageField = 'damage';
const itemFishingDamageField = 'fishingDamage';
const itemBonusStatsField = 'bonusStats';
const itemRequirementsField = 'requirements';
const itemClaszField = 'clasz';
