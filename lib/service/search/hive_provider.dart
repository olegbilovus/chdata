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

    for (final assetBox in assetsBoxes.keys) {
      final boxName = assetBox;
      final adapters = assetsBoxes[assetBox]!.toList();
      for (final registerAdapter in adapters) {
        try {
          registerAdapter(true);
        } on HiveError catch (e) {
          dev.log(e.toString());
        }
      }

      final bytesBox = await rootBundle.load('$assetsDir/$boxName.hive');
      final box =
          await Hive.openBox(boxName, bytes: bytesBox.buffer.asUint8List());
      _boxesKeys[boxName] = box.keys.map((e) => e.toString()).toList();
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
    final box = Hive.box(database);
    final List<SearchData<T>> data = [];
    if (contains) {
      for (final boxKey in keys) {
        if (_getKey(boxKey.toLowerCase()).contains(keyLower)) {
          data.add(SearchData<T>(
              key: boxKey, data: retrieve ? box.get(boxKey) : null));
        }
      }
    } else {
      final result =
          BinarySearchOccurrences.search<String>(keys, key, getKey: _getKey);
      for (final res in result) {
        data.add(SearchData<T>(key: res, data: retrieve ? box.get(res) : null));
      }
    }
    return data;
  }

  String _getKey(dynamic obj) => obj.split(separator)[0];

  @override
  Future<SearchData<T>> searchOne<T>(
      {required String database, required String key}) async {
    final box = Hive.box(database);
    final data = box.get(key);

    return SearchData(key: key, data: data);
  }
}
