import 'dart:io';

import 'package:chdata/models/item/item.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:hive/hive.dart';

import 'constants.dart';

void main() async {
  // filePath declared in ./constants.dart which is git ignored to avoid
  // exporting it
  final data = File(itemFilePath);

  Hive.init(assetsDir);
  for (final registerAdapter in assetsBoxes[itemListField]!) {
    registerAdapter(true);
  }
  final box = await Hive.openBox(itemListField);
  await box.clear();

  final itemsStr = data.readAsLinesSync().map((e) => e.trim()).toList();
  for (final itemStr in itemsStr) {
    final values = itemStr.split(separator).map((e) {
      var str = e;
      if (e.startsWith("'")) {
        str = e.substring(1);
      }
      if (e.endsWith("'")) {
        str = str.substring(0, str.length - 1);
      }
      return str.trim();
    }).toList();
    final item = parseValues(values);
    box.put('${item.name}$separator${item.id}', item);
  }

  await box.close();
}

Item parseValues(List<String> values) {
  return Item(
    id: parseInt(values[0]),
    name: values[1],
    description: values[2],
  );
}

// Using a function for it in case the parsing changes,
// this will avoid to refactor a lot of code
int parseInt(String value) {
  return int.parse(value);
}

double parseDouble(String value) {
  return double.parse(value);
}
