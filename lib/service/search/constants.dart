import 'package:hive/hive.dart';

import '../../models/mob.dart';

const assetsDir = 'hive';
const separator = '~';

const mobListField = 'moblist';
const itemListField = 'itemlist';

final assetsBoxes = <String, List<Function(bool ovverride)>>{
  mobListField: [
    (override) => Hive.registerAdapter(MobOpinionAdapter(), override: override),
    (override) => Hive.registerAdapter(MobAdapter(), override: override)
  ]
};

const searchPatternField = 'searchPattern';
const searchContainsField = 'searchContains';
