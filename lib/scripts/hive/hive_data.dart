import 'package:chdata/service/search/constants.dart';
import 'package:chdata/scripts/hive/data.dart';
import 'package:hive/hive.dart';

import '../../models/mob.dart';

void main() async {
  const boxName = mobListField;

  Hive.init('hive');
  Hive.registerAdapter(MobAdapter());
  final box = await Hive.openBox(boxName);
  for (final data in hiveData) {
    final value = data.split(separator);
    box.put(data, Mob(name: value[0], id: int.parse(value[1])));
  }
}
