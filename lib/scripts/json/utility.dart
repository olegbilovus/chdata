import 'dart:collection';
import 'dart:convert';
import 'dart:io';

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

  final jsonFile = File('$jsonAssetsScriptDir/$listField.json');
  jsonFile.writeAsStringSync(jsonEncode(map));
}
