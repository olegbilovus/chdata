import 'package:chdata/models/advance_stats.dart';
import 'package:chdata/models/item/enum/subtype.dart';
import 'package:chdata/models/item/item.dart';
import 'package:chdata/models/item/requirements.dart';
import 'package:chdata/models/zone/zone_map.dart';
import 'package:hive/hive.dart';

import '../../models/item/advance_stats_bonus.dart';
import '../../models/item/enum/class.dart';
import '../../models/item/enum/equipment_slot.dart';
import '../../models/mob/enum/mob_opinion.dart';
import '../../models/mob/mob.dart';

const separator = '~';

const mobListField = 'mobList';
const itemListField = 'itemList';
const zoneListField = 'zoneList';

final assetsBoxes = <String, List<Function()>>{
  mobListField: [
    () => Hive.registerAdapter(AdvanceStatsAdapter()),
    () => Hive.registerAdapter(MobOpinionAdapter()),
    () => Hive.registerAdapter(MobAdapter())
  ],
  itemListField: [
    () => Hive.registerAdapter(ClassAdapter()),
    () => Hive.registerAdapter(RequirementsAdapter()),
    () => Hive.registerAdapter(AdvanceStatsBonusAdapter()),
    () => Hive.registerAdapter(AdvanceStatsAdapter()),
    () => Hive.registerAdapter(SubTypeAdapter()),
    () => Hive.registerAdapter(EquipmentSlotAdapter()),
    () => Hive.registerAdapter(ItemAdapter())
  ],
  zoneListField: [
    () => Hive.registerAdapter(ZoneMapAdapter()),
  ]
};

const searchPatternField = 'searchPattern';
const searchContainsField = 'searchContains';
const databaseField = 'database';
const showAllField = 'showAll';
