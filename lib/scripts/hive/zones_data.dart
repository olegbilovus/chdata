import 'dart:io';

import 'package:chdata/models/zone/zone_map.dart';
import 'package:chdata/scripts/hive/constants_hidden.dart';
import 'package:hive/hive.dart';

import '../../service/search/constants.dart';
import 'constants.dart';

void main() async {
  final data = File(zoneFilePath);

  Hive.init(hiveAssetsScriptDir);
  for (final registerAdapter in assetsBoxes[zoneListField]!) {
    registerAdapter();
  }
  final box = await Hive.openBox(zoneListField);
  await box.clear();

  final zoneStr = data.readAsLinesSync().map((e) => e.trim()).toList();
  for (final zoneStr in zoneStr) {
    final values = zoneStr.split(separator).map((e) {
      var str = e;
      if (e.startsWith("'")) {
        str = e.substring(1);
      }
      if (e.endsWith("'")) {
        str = str.substring(0, str.length - 1);
      }
      return str.trim();
    }).toList();
    final zone = parseValues(values);
    box.put('${zone.name}$separator${zone.id}', zone);
  }

  await box.close();
}

ZoneMap parseValues(List<String> values) {
  return ZoneMap(
      id: parseInt(values[0]), name: values[1], assetName: values[2]);
}

int parseInt(String value) {
  return int.parse(value);
}
