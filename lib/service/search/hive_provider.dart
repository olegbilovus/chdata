import 'dart:developer' as dev;

import 'package:chdata/service/search/search_data.dart';
import 'package:chdata/service/search/search_provider.dart';
import 'package:chdata/utilities/alg/binary_search_occurrences.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

class HiveProvider implements SearchProvider {
  final Map<String, List<String>> _boxesKeys = {};
  static bool calledInit = false;

  HiveProvider._sharedInstance();

  static final HiveProvider _instance = HiveProvider._sharedInstance();

  factory HiveProvider() => _instance;

  @override
  Future<void> init() async {
    if (calledInit) {
      return;
    }
    calledInit = true;
    await Hive.initFlutter(assetsDir);

    for (final assetBox in assetsBoxes) {
      final (boxName, adapter) = assetBox;
      final box = await Hive.openLazyBox(boxName);
      try {
        Hive.registerAdapter(adapter);
      } on HiveError catch (e) {
        dev.log(e.toString());
      }
      final boxKeys = box.keys;

      // This will happen only at the first startup
      if (boxKeys.isEmpty) {
        dev.log('Box $boxName is empty, filling the content from assets');
        await box.close();
        final boxMem = await Hive.openBox(boxName);
        final bytesBoxIndex = await rootBundle.load('$assetsDir/$boxName.hive');
        final tmpBox = await Hive.openBox('_tmp$boxName',
            bytes: bytesBoxIndex.buffer.asUint8List());

        _boxesKeys[boxName] = [];
        for (final key in tmpBox.keys) {
          boxMem.put(key, tmpBox.get(key)!);
          _boxesKeys[boxName]!.add(key.toString());
        }
        await tmpBox.close();
        await boxMem.close();
        await Hive.openLazyBox(boxName);
      } else {
        dev.log('Box $boxName has ${boxKeys.length} keys');
        _boxesKeys[boxName] = boxKeys.map((e) => e.toString()).toList();
      }
    }
  }

  @override
  Future<List<SearchData<T>>> search<T>(
      {required String database,
      required String key,
      bool contains = false,
      bool retrieve = false}) async {
    final keyLower = key.toLowerCase();
    final keys = _boxesKeys[database] ?? [];
    final box = Hive.lazyBox(database);
    final List<SearchData<T>> data = [];
    if (contains) {
      for (final boxKey in keys) {
        if (_getKey(boxKey.toLowerCase()).contains(keyLower)) {
          data.add(SearchData<T>(
              key: boxKey, data: retrieve ? await box.get(boxKey) : null));
        }
      }
    } else {
      final result =
          BinarySearchOccurrences.search<String>(keys, key, getKey: _getKey);
      for (final res in result) {
        data.add(SearchData<T>(
            key: res, data: retrieve ? await box.get(res) : null));
      }
    }
    return data;
  }

  String _getKey(dynamic obj) => obj.split(separator)[0];
}
