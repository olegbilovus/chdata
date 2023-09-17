import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:chdata/utilities/strings/process.dart';

import '../../service/search/constants.dart';
import 'constants.dart';

String processData(
    {required String filePath,
    required ParseValues parseValues,
    String? listField}) {
  final map = SplayTreeMap<String, Map<String, dynamic>>(
    (key1, key2) => processForSort(key1).compareTo(processForSort(key2)),
  );
  final listValues = getValues(filePath);

  for (final values in listValues) {
    final model = parseValues(values);
    map[buildKey(model.name, model.id)] = model.toJson();
  }

  final compressedString = compress(jsonEncode(map));

  if (listField != null) {
    final jsonFile = File('$jsonAssetsScriptDir/$listField.json');
    jsonFile.writeAsStringSync(compressedString);
  }
  return compressedString;
}

List<List<String>> getValues(String filePath) {
  final data = File(filePath);
  final list = <List<String>>[];

  final modelStr = data.readAsLinesSync().map((e) => e.trim()).toList();
  for (final modelStr in modelStr) {
    final values = modelStr.split(separator).map((e) {
      var str = e;
      if (e.startsWith("'")) {
        str = e.substring(1);
      }
      if (e.endsWith("'")) {
        str = str.substring(0, str.length - 1);
      }
      str = str.replaceAll('[', '').replaceAll(']', '');
      return str.trim();
    }).toList();
    list.add(values);
  }

  return list;
}

String compress(String str) {
  final stringBytes = utf8.encode(str);
  final gzipBytes = GZipEncoder().encode(stringBytes);
  final compressedString = base64.encode(gzipBytes!);
  return compressedString;
}

String decompress(String str) {
  final decodeBase64 = base64.decode(str);
  final decodeGZip = GZipDecoder().decodeBytes(decodeBase64);
  final decompressedString = utf8.decode(decodeGZip);
  return decompressedString;
}

String buildKey(String name, int id) => '$name$separator$id';
