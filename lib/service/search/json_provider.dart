import 'dart:convert';
import 'dart:developer' as dev;

import 'package:chdata/scripts/json/utility.dart';
import 'package:chdata/service/search/search_data.dart';
import 'package:chdata/service/search/search_provider.dart';
import 'package:chdata/utilities/alg/binary_search_occurrences.dart';
import 'package:chdata/utilities/strings/manipulation.dart';
import 'package:flutter/services.dart';

import '../../models/model.dart';
import 'const_asset_dir.dart';
import 'constants.dart';

class JsonProvider implements SearchProvider {
  final Map<String, Map<String, dynamic>> _assets = {};
  final Map<String, List<String>> _assetsKeys = {};

  JsonProvider._sharedInstance();

  static final JsonProvider _instance = JsonProvider._sharedInstance();

  factory JsonProvider() => _instance;

  final openedAssets = <String, bool>{};

  @override
  Future<void> init() async {
    return;
  }

  @override
  Future<List<SearchData<T>>> search<T extends Model>(
      {required String database,
      required String key,
      bool contains = false,
      bool retrieve = false,
      required T model}) async {
    final asset = await _loadAsset(database);
    final keys = _assetsKeys[database]!;
    final keyLower = key.toLowerCase();

    final List<SearchData<T>> data = [];
    if (contains) {
      for (final key in keys) {
        if (_getKey(key.toLowerCase()).contains(keyLower)) {
          data.add(SearchData<T>(
              key: key,
              data: retrieve ? model.fromJson(asset[key]!) as T : null));
        }
      }
    } else {
      final result =
          BinarySearchOccurrences.search<String>(keys, key, getKey: _getKey);
      for (final res in result) {
        data.add(SearchData<T>(
            key: res,
            data: retrieve ? model.fromJson(asset[res]!) as T : null));
      }
    }
    return data;
  }

  String _getKey(dynamic obj) => processForSort(obj.split(separator)[0]);

  @override
  Future<SearchData<T>> searchOne<T extends Model>(
      {required String database, required String key, required T model}) async {
    final asset = await _loadAsset(database);
    final json = asset[key]!;

    return SearchData<T>(key: key, data: model.fromJson(json) as T);
  }

  Future<Map<String, dynamic>> _loadAsset(String database) async {
    if (_assets.containsKey(database)) {
      return _assets[database]!;
    }
    dev.log('Loading $database');
    final compressedString =
        await rootBundle.loadString('$jsonAssetsDir/$database.json');
    final uncompressedString = decompress(compressedString);
    final json = jsonDecode(uncompressedString);
    _assets[database] = json;
    _assetsKeys[database] = json.keys.toList();

    return json;
  }
}
