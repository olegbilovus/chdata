import 'dart:io';

import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/models/item/advance_stats_bonus.dart';
import 'package:chdata/models/item/constants.dart';
import 'package:chdata/models/item/enum/class.dart';
import 'package:chdata/models/item/enum/subtype.dart';
import 'package:chdata/models/item/item.dart';
import 'package:chdata/models/item/requirements.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:hive/hive.dart';

import '../../models/item/enum/equipment_slot.dart';
import 'constants.dart';

void main() async {
  // filePath declared in ./constants.dart which is git ignored to avoid
  // exporting it
  final data = File(itemFilePath);

  Hive.init(assetsDir);
  for (final registerAdapter in assetsBoxes[itemListField]!) {
    registerAdapter(true);
  }
  final box = await Hive.openBox(itemListField);
  await box.clear();

  final itemsStr = data.readAsLinesSync().map((e) => e.trim()).toList();
  for (final itemStr in itemsStr) {
    final values = itemStr.split(separator).map((e) {
      var str = e;
      if (e.startsWith("'")) {
        str = e.substring(1);
      }
      if (e.endsWith("'")) {
        str = str.substring(0, str.length - 1);
      }
      return str.trim();
    }).toList();
    final item = parseValues(values);
    box.put('${item.name}$separator${item.id}', item);
  }

  await box.close();
}

Item parseValues(List<String> values) {
  final (damage, fishingDamage) = getAdvanceStatsAndFishing(values[12]);
  return Item(
    id: parseInt(values[0]),
    name: values[1],
    description: values[2],
    stackable: parseBool(values[3]),
    armor: parseInt(values[4]),
    equipmentSlot: getEquipmentSlot(values[5]),
    buy: parseInt(values[6]),
    sell: parseInt(values[7]),
    weight: parseInt(values[8]),
    attackSpeed: parseInt(values[9]),
    subType: getSubType(values[10]),
    noTrade: parseBool(values[11]),
    damage: damage,
    fishingDamage: fishingDamage,
    bonusStats: getAdvanceStatsBonus(values[12]),
    requirements: getRequirements(values[13]),
    clasz: getClass(values[14]),
  );
}

// Using functions for parsing in case the parsing changes,
// this will avoid to refactor a lot of code
int parseInt(String value) {
  if (value == emptyValueText) {
    return emptyValueInt;
  }
  return int.parse(value);
}

double parseDouble(String value) {
  if (value == emptyValueText) {
    return emptyValueDouble;
  }
  return double.parse(value);
}

bool parseBool(String value) {
  if (value == '0') {
    return false;
  }
  return true;
}

EquipmentSlot getEquipmentSlot(String value) {
  return switch (value) {
    '-1' => EquipmentSlot.unequipable,
    '0' => EquipmentSlot.mainHand,
    '1' => EquipmentSlot.head,
    '2' => EquipmentSlot.chest,
    '3' => EquipmentSlot.leg,
    '4' => EquipmentSlot.feet,
    '5' => EquipmentSlot.offhand,
    '6' => EquipmentSlot.hands,
    '7' => EquipmentSlot.misc,
    '8' || '9' || '10' || '11' => EquipmentSlot.ring,
    '12' || '13' => EquipmentSlot.wrist,
    '14' => EquipmentSlot.neck,
    '15' => EquipmentSlot.hat,
    '16' => EquipmentSlot.top,
    '17' => EquipmentSlot.bottoms,
    '18' => EquipmentSlot.shoes,
    '19' => EquipmentSlot.gloves,
    '20' => EquipmentSlot.companion,
    '21' => EquipmentSlot.saddle,
    '22' => EquipmentSlot.mount,
    _ => EquipmentSlot.none
  };
}

SubType getSubType(String value) {
  return switch (value) {
    '1' => SubType.sword,
    '2' => SubType.axe,
    '3' => SubType.blunt,
    '4' => SubType.cloth,
    '5' => SubType.leather,
    '6' => SubType.chain,
    '7' => SubType.plate,
    '8' => SubType.staff,
    '9' => SubType.dagger,
    '10' => SubType.wand,
    '11' => SubType.bow,
    '12' => SubType.shield,
    '13' => SubType.twoHSword,
    '14' => SubType.twoHAxe,
    '15' => SubType.twoHBlunt,
    '16' => SubType.quiver,
    '17' => SubType.offhandDagger,
    '18' => SubType.offhandSword,
    '19' => SubType.spear,
    '20' => SubType.totem,
    '21' => SubType.broom,
    '22' => SubType.sled,
    '23' => SubType.handToHand,
    '24' => SubType.fashion,
    '25' => SubType.jewelry,
    '26' => SubType.carpet,
    '27' => SubType.noveltyBroom,
    '28' => SubType.noveltyWand,
    '29' => SubType.lute,
    '30' => SubType.dragonStaff,
    '31' => SubType.flute,
    '32' => SubType.harp,
    '33' => SubType.twoHNovelty,
    '34' => SubType.noveltyStaffMount,
    '35' => SubType.horn,
    '36' => SubType.noveltyBlunt,
    '37' => SubType.batMount,
    '38' => SubType.wings,
    '39' => SubType.drum,
    '40' => SubType.bagpipes,
    '41' => SubType.eagleMount,
    '42' => SubType.test,
    '43' => SubType.crow,
    '44' => SubType.sparrow,
    '45' => SubType.sparrowhawk,
    '46' => SubType.cape,
    '47' => SubType.horse,
    '48' => SubType.bansheeBlade,
    '49' => SubType.samhainCrow,
    '50' => SubType.samhainWings,
    '51' => SubType.playDead,
    '52' => SubType.banner,
    '53' => SubType.boar,
    '54' => SubType.fishingRod,
    '55' => SubType.longTotem,
    '56' => SubType.offhandBook,
    '57' => SubType.twoHSpear,
    '58' => SubType.petFood,
    '59' => SubType.fishingItem,
    '60' => SubType.token,
    '61' => SubType.consumable,
    '62' => SubType.battleMount,
    '63' => SubType.battleMountWand,
    '64' => SubType.battleMountBow,
    '65' => SubType.battleMountUnarmed,
    '66' => SubType.cooking,
    _ => SubType.none
  };
}

enum ASB {
  pierce,
  slash,
  crush,
  heat,
  cold,
  magic,
  poison,
  divine,
  chaos,
  truee,
  attack,
  defence,
  health,
  energy,
  fishing,
  concentration
}

(AdvanceStats, int) getAdvanceStatsAndFishing(String values) {
  final valuesMultiple = values.split(separatorMultiValues);
  final advStats = <ASB, int>{};
  for (final val in valuesMultiple) {
    final vals = val.split(separatorKeyValue);
    _setMapAdvanceStatsAndBonus(vals, advStats);
  }

  return (
    AdvanceStats(
        pierce: advStats[ASB.pierce] ?? emptyValueInt,
        slash: advStats[ASB.slash] ?? emptyValueInt,
        crush: advStats[ASB.crush] ?? emptyValueInt,
        heat: advStats[ASB.heat] ?? emptyValueInt,
        cold: advStats[ASB.cold] ?? emptyValueInt,
        magic: advStats[ASB.magic] ?? emptyValueInt,
        poison: advStats[ASB.poison] ?? emptyValueInt,
        divine: advStats[ASB.divine] ?? emptyValueInt,
        chaos: advStats[ASB.chaos] ?? emptyValueInt,
        truee: advStats[ASB.truee] ?? emptyValueInt),
    advStats[ASB.fishing] ?? emptyValueInt
  );
}

void _setMapAdvanceStatsAndBonus(List<String> vals, Map<ASB, int> advStats) {
  switch (vals[0]) {
    case '0':
      advStats[ASB.pierce] = parseInt(vals[1]);
      break;
    case '1':
      advStats[ASB.slash] = parseInt(vals[1]);
      break;
    case '2':
      advStats[ASB.crush] = parseInt(vals[1]);
      break;
    case '3':
      advStats[ASB.heat] = parseInt(vals[1]);
      break;
    case '4':
      advStats[ASB.cold] = parseInt(vals[1]);
      break;
    case '5':
      advStats[ASB.magic] = parseInt(vals[1]);
      break;
    case '6':
      advStats[ASB.poison] = parseInt(vals[1]);
      break;
    case '7':
      advStats[ASB.divine] = parseInt(vals[1]);
      break;
    case '8':
      advStats[ASB.chaos] = parseInt(vals[1]);
      break;
    case '9':
      advStats[ASB.truee] = parseInt(vals[1]);
      break;
    case '10':
      advStats[ASB.attack] = parseInt(vals[1]);
      break;
    case '11':
      advStats[ASB.defence] = parseInt(vals[1]);
      break;
    case '12':
      advStats[ASB.health] = parseInt(vals[1]);
      break;
    case '13':
      advStats[ASB.energy] = parseInt(vals[1]);
      break;
    case '15':
      advStats[ASB.fishing] = parseInt(vals[1]);
      break;
    case '16':
      advStats[ASB.concentration] = parseInt(vals[1]);
      break;
  }
}

AdvanceStatsBonus getAdvanceStatsBonus(String values) {
  final valuesMultiple = values.split(separatorMultiValues);
  final advStats = <ASB, int>{};
  for (final val in valuesMultiple) {
    final vals = val.split(separatorKeyValue);
    _setMapAdvanceStatsAndBonus(vals, advStats);
  }

  return AdvanceStatsBonus(
      pierce: advStats[ASB.pierce] ?? emptyValueInt,
      slash: advStats[ASB.slash] ?? emptyValueInt,
      crush: advStats[ASB.crush] ?? emptyValueInt,
      heat: advStats[ASB.heat] ?? emptyValueInt,
      cold: advStats[ASB.cold] ?? emptyValueInt,
      magic: advStats[ASB.magic] ?? emptyValueInt,
      poison: advStats[ASB.poison] ?? emptyValueInt,
      divine: advStats[ASB.divine] ?? emptyValueInt,
      chaos: advStats[ASB.chaos] ?? emptyValueInt,
      truee: advStats[ASB.truee] ?? emptyValueInt,
      attack: advStats[ASB.attack] ?? emptyValueInt,
      defence: advStats[ASB.defence] ?? emptyValueInt,
      health: advStats[ASB.health] ?? emptyValueInt,
      energy: advStats[ASB.energy] ?? emptyValueInt,
      fishingResist: advStats[ASB.fishing] ?? emptyValueInt,
      concentration: advStats[ASB.concentration] ?? emptyValueInt);
}

enum Req {
  strength,
  dexterity,
  focus,
  vitality,
  maleOnly,
  level,
}

Requirements getRequirements(String values) {
  final valuesMultiple = values.split(separatorMultiValues);
  final reqs = <Req, int>{};
  for (final val in valuesMultiple) {
    final vals = val.split(separatorKeyValue);
    _setMapReq(vals, reqs);
  }

  return Requirements(
      strength: reqs[Req.strength] ?? emptyValueInt,
      dexterity: reqs[Req.dexterity] ?? emptyValueInt,
      focus: reqs[Req.focus] ?? emptyValueInt,
      vitality: reqs[Req.vitality] ?? emptyValueInt,
      maleOnly: reqs[Req.maleOnly] == 1 ? true : false,
      level: reqs[Req.level] ?? emptyValueInt);
}

void _setMapReq(List<String> vals, Map<Req, int> reqs) {
  switch (vals[0]) {
    case '0':
      reqs[Req.strength] = parseInt(vals[1]);
      break;
    case '1':
      reqs[Req.dexterity] = parseInt(vals[1]);
      break;
    case '2':
      reqs[Req.focus] = parseInt(vals[1]);
      break;
    case '3':
      reqs[Req.vitality] = parseInt(vals[1]);
      break;
    case '4':
      reqs[Req.focus] = parseInt(vals[1]);
      break;
    case '5':
      reqs[Req.level] = parseInt(vals[1]);
      break;
  }
}

Class getClass(String value) {
  return switch (value) {
    '1' => Class.warrior,
    '2' => Class.druid,
    '3' => Class.mage,
    '4' => Class.ranger,
    _ => Class.rogue,
  };
}
