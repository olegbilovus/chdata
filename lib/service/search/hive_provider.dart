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

  final openedBox = <String, bool>{};

  @override
  Future<void> init() async {
    if (calledInit) {
      return;
    }
    calledInit = true;
    await Hive.initFlutter(assetsDir);
  }

  @override
  Future<List<SearchData<T>>> search<T>(
      {required String database,
      required String key,
      bool contains = false,
      bool retrieve = false}) async {
    final box = await _loadDatabase(database);
    final keys = _boxesKeys[database] ?? [];
    final keyLower = key.toLowerCase();

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
    final box = await _loadDatabase(database);
    final data = box.get(key);

    return SearchData(key: key, data: data);
  }

  Future<Box> _loadDatabase(String database) async {
    if (openedBox[database] ?? false) {
      return Hive.box(database);
    }
    final adapters = assetsBoxes[database]!.toList();
    for (final registerAdapter in adapters) {
      try {
        registerAdapter(true);
      } on HiveError catch (e) {
        dev.log(e.toString());
      }
    }

    final bytesBox = await rootBundle.load('$assetsDir/$database.hive');
    final box =
        await Hive.openBox(database, bytes: bytesBox.buffer.asUint8List());
    _boxesKeys[database] = box.keys.map((e) => e.toString()).toList();
    openedBox[database] = true;

    dev.log('Loaded $database box');
    return box;
  }
}
