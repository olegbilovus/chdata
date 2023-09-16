import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:chdata/models/mob/mob.dart';
import 'package:chdata/models/mob/spawn.dart';
import 'package:chdata/service/search/constants.dart';

import '../../../models/item/constants.dart';
import '../../../models/mob/constants.dart';
import '../constants_hidden.dart';
import '../utility.dart';

void main() {
  final zoneMapStr = File(zoneMapsJsonFilePath).readAsStringSync();
  final zoneMapsJson = jsonDecode(decompress(zoneMapStr));
  final zoneMapKeys = SplayTreeMap<int, String>();
  for (final zoneKey in zoneMapsJson.keys) {
    final values = zoneKey.split(separator);
    zoneMapKeys[int.parse(values[1])] = zoneKey;
  }

  final listValues = getValues(spawnFilePath);
  final processedSpawns = processSpawns(listValues, zoneMapKeys);

  final mobsFile = File(mobsJsonFilePath);
  final mobsStr = mobsFile.readAsStringSync();
  final mobsJson = jsonDecode(decompress(mobsStr));

  for (final mobKey in mobsJson.keys) {
    final mob = mobsJson[mobKey];
    final spawns = mob[mobSpawnsField] as List;
    spawns.clear();
    if (processedSpawns.containsKey(mob[mobIdField])) {
      for (final dataSpawn in processedSpawns[mob[mobIdField]]!) {
        final spawn = _processValues(dataSpawn);
        spawns.add(spawn.toJson());
      }
    }
  }

  final mobJsonCompressed = compress(jsonEncode(mobsJson));
  mobsFile.writeAsStringSync(mobJsonCompressed);
}

SplayTreeMap<int, List<List<String>>> processSpawns(
    List<List<String>> listValues, Map<int, String> zoneMapKeys) {
  final result = SplayTreeMap<int, List<List<String>>>();
  for (final values in listValues) {
    final mobIds = values[7]
        .split(separatorMultiValues)
        .map((e) => int.parse(e.split(separatorMobIDWeight)[0]));
    values[1] = zoneMapKeys[int.parse(values[1])] ?? emptyValueText;
    for (final mobId in mobIds) {
      if (result.containsKey(mobId)) {
        result[mobId]!.add(values);
      } else {
        result[mobId] = [values];
      }
    }
  }
  return result;
}

Spawn _processValues(List<String> values) {
  final timers =
      values[2].split(separatorSpawnTimers).map((e) => e.trim()).toList();
  final minTimer = _parseTimer(timers[0]);
  final maxTimer = timers.length == 2 ? _parseTimer(timers[1]) : minTimer;
  return Spawn(
    zoneKey: values[1],
    minSpawnSecs: minTimer,
    maxSpawnSecs: maxTimer,
  );
}

int _parseTimer(String timer) {
  int seconds = 0;
  final values = timer.split(separatorSpawnTimersValues);

  for (int i = 0; i < values.length; i += 2) {
    final intVal = int.parse(values[i]);
    switch (values[i + 1]) {
      case 'sec':
        seconds += intVal;
        break;
      case 'min':
        seconds += intVal * 60;
        break;
      case 'hr':
        seconds += intVal * 60 * 60;
        break;
      case 'days':
        seconds += intVal * 24 * 60 * 60;
        break;
    }
  }

  return seconds;
}
