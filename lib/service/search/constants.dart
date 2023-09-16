import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/models/item/advance_stats_bonus.dart';
import 'package:chdata/models/item/enum/class.dart';
import 'package:chdata/models/item/enum/equipment_slot.dart';
import 'package:chdata/models/item/enum/subtype.dart';
import 'package:chdata/models/item/item.dart';
import 'package:chdata/models/item/requirements.dart';
import 'package:chdata/models/mob/enum/mob_opinion.dart';
import 'package:chdata/models/mob/mob.dart';

import '../../models/zone_map/zone_map.dart';

const separator = '~';

const mobListField = 'mobList';
const itemListField = 'itemList';
const zoneMapListField = 'zoneMapList';
const assets = <String>[mobListField, itemListField, zoneMapListField];

const searchPatternField = 'searchPattern';
const searchContainsField = 'searchContains';
const databaseField = 'database';
const showAllField = 'showAll';

const _advanceStats = AdvanceStats(
    pierce: 0,
    slash: 0,
    crush: 0,
    heat: 0,
    cold: 0,
    magic: 0,
    poison: 0,
    divine: 0,
    chaos: 0,
    truee: 0);

const itemModel = Item(
    id: 0,
    name: '',
    description: '',
    stackable: false,
    armor: 0,
    equipmentSlot: EquipmentSlot.none,
    buy: 0,
    sell: 0,
    weight: 0,
    attackSpeed: 0,
    subType: SubType.none,
    noTrade: false,
    damage: _advanceStats,
    fishingDamage: 0,
    bonusStats: AdvanceStatsBonus(
        pierce: 0,
        slash: 0,
        crush: 0,
        heat: 0,
        cold: 0,
        magic: 0,
        poison: 0,
        divine: 0,
        chaos: 0,
        truee: 0,
        attack: 0,
        defence: 0,
        health: 0,
        energy: 0,
        fishingResist: 0,
        concentration: 0),
    requirements: Requirements(
        strength: 0,
        dexterity: 0,
        focus: 0,
        vitality: 0,
        maleOnly: false,
        level: 0),
    clasz: Class.none);

const mobModel = Mob(
    id: 0,
    name: '',
    range: 0.0,
    followRange: 0,
    opinion: MobOpinion.none,
    level: 0,
    health: 0,
    goldMin: 0,
    goldMax: 0,
    attack: 0,
    defence: 0,
    attackSpeed: 0,
    energy: 0,
    damage: _advanceStats,
    fishingDamage: 0,
    resist: _advanceStats,
    stars: 0,
    attackRange: 0,
    missileSpeed: 0,
    xp: 0,
    physicalEvade: 0,
    spellEvade: 0,
    moveEvade: 0,
    woundEvade: 0,
    weakEvade: 0,
    mentalEvade: 0,
    spawns: []);

const zoneMapModel = ZoneMap(id: 0, name: '', assetName: '');
