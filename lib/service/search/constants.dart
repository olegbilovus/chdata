import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/models/item/enum/subtype.dart';
import 'package:chdata/models/item/item.dart';
import 'package:chdata/models/item/requirements.dart';
import 'package:hive/hive.dart';

import '../../models/item/advance_stats_bonus.dart';
import '../../models/item/enum/class.dart';
import '../../models/item/enum/equipment_slot.dart';
import '../../models/mob/enum/mob_opinion.dart';
import '../../models/mob/mob.dart';

const assetsDir = 'hive';
const separator = '~';

const mobListField = 'moblist';
const itemListField = 'itemlist';

final assetsBoxes = <String, List<Function(bool ovverride)>>{
  mobListField: [
    (override) =>
        Hive.registerAdapter(AdvanceStatsAdapter(), override: override),
    (override) => Hive.registerAdapter(MobOpinionAdapter(), override: override),
    (override) => Hive.registerAdapter(MobAdapter(), override: override)
  ],
  itemListField: [
    (override) => Hive.registerAdapter(ClassAdapter(), override: override),
    (override) =>
        Hive.registerAdapter(RequirementsAdapter(), override: override),
    (override) =>
        Hive.registerAdapter(AdvanceStatsBonusAdapter(), override: override),
    (override) =>
        Hive.registerAdapter(AdvanceStatsAdapter(), override: override),
    (override) => Hive.registerAdapter(SubTypeAdapter(), override: override),
    (override) =>
        Hive.registerAdapter(EquipmentSlotAdapter(), override: override),
    (override) => Hive.registerAdapter(ItemAdapter(), override: override)
  ]
};

const searchPatternField = 'searchPattern';
const searchContainsField = 'searchContains';
const databaseField = 'database';
