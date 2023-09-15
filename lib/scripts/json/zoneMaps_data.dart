import 'package:chdata/scripts/json/utility.dart';

import '../../models/zone_map/zone_map.dart';
import '../../service/search/constants.dart';
import 'constants_hidden.dart';

void main() async {
  processAndSaveData(
      filePath: zoneFilePath,
      listField: zoneMapListField,
      parseValues: _parseValues);
}

ZoneMap _parseValues(List<String> values) {
  return ZoneMap(
      id: parseInt(values[0]), name: values[1], assetName: values[2]);
}

int parseInt(String value) {
  return int.parse(value);
}
