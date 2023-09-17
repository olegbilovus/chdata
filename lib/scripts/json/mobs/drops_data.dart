import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:chdata/models/item/item.dart';
import 'package:chdata/models/mob/mob.dart';
import 'package:chdata/utilities/alg/binary_search_occurrences.dart';
import 'package:chdata/utilities/strings/process.dart';

import '../constants_hidden.dart';
import '../utility.dart';

void main() {
  final mobLootValues = getValues(mobLootSetListFilePath)
      .map((e) => e.map((e) => int.parse(e)).toList())
      .toList()
    ..sort((a, b) => a[0].compareTo(b[0]));
  final lootSetValues = getValues(lootSetListFilePath)
      .map((e) => e.map((e) => int.parse(e)).toList())
      .toList()
    ..sort((a, b) => a[0].compareTo(b[0]));
  final lootTableItemValues = getValues(lootTableItemListFilePath)
      .map((e) => e.map((e) => int.parse(e)).toList())
      .toList()
    ..sort((a, b) => a[0].compareTo(b[0]));

  final mobsFile = File(mobsJsonFilePath);
  final mobsStr = mobsFile.readAsStringSync();
  final mobsJson = jsonDecode(decompress(mobsStr));

  final itemsFile = File(itemsJsonFilePath);
  final itemsStr = itemsFile.readAsStringSync();
  final itemsJson = jsonDecode(decompress(itemsStr));
  final itemJsonValues = itemsJson.values;
  final itemsKeys = SplayTreeMap<int, String>();

  for (final item in itemJsonValues) {
    item[itemMobsField] = [];
    itemsKeys[item[itemIdField]] =
        buildKey(item[itemNameField], item[itemIdField]);
  }

  for (final mob in mobsJson.values) {
    final drops = <String>[];
    final mobLoots = _search(mobLootValues, mob[mobIdField]);
    for (final loot in mobLoots) {
      final lootSets = _search(lootSetValues, loot[1]);
      for (final set in lootSets) {
        if (set[1] != -1) {
          final items = _search(lootTableItemValues, set[1]);
          for (final item in items) {
            if (item[1] != 0) {
              final itemKey = itemsKeys[item[1]];
              itemsJson[itemKey][itemMobsField]
                  .add(buildKey(mob[mobNameField], mob[mobIdField]));
              drops.add(itemKey!);
            }
          }
        }
      }
    }
    drops.sort((a, b) => processForSort(a).compareTo(processForSort(b)));
    mob[mobDropsField] = drops;
  }

  final mobJsonCompressed = compress(jsonEncode(mobsJson));
  mobsFile.writeAsStringSync(mobJsonCompressed);

  for (final item in itemJsonValues) {
    item[itemMobsField]
        .sort((a, b) => processForSort(a).compareTo(processForSort(b)));
  }

  final itemJsonCompressed = compress(jsonEncode(itemsJson));
  itemsFile.writeAsStringSync(itemJsonCompressed);
}

List _search(List items, int key) {
  return BinarySearchOccurrences.search(items, key,
      getKey: (values) => values[0], equals: (a, b) => a == b);
}
