import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';

import '../../service/search/constants.dart';
import 'constants.dart';

void processAndSaveData(
    {required String filePath,
    required String listField,
    required ParseValues parseValues}) {
  final data = File(filePath);

  final map = SplayTreeMap<String, Map<String, dynamic>>();

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
      return str.trim();
    }).toList();
    final model = parseValues(values);
    map['${model.name}$separator${model.id}'] = model.toJson();
  }

  final compressedString = compress(jsonEncode(map));

  final jsonFile = File('$jsonAssetsScriptDir/$listField.json');
  jsonFile.writeAsStringSync(compressedString);
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
