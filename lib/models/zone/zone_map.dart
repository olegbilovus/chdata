import 'package:chdata/models/model.dart';

class ZoneMap implements Model {
  final int id;
  final String name;
  final String assetName;

  const ZoneMap(
      {required this.id, required this.name, required this.assetName});

  ZoneMap.fromJson(Map<String, dynamic> json)
      : id = json[zoneMapIdField] as int,
        name = json[zoneMapNameField] as String,
        assetName = json[zoneMapAssetNameField] as String;

  @override
  Map<String, dynamic> toJson() => {
        zoneMapIdField: id,
        zoneMapNameField: name,
        zoneMapAssetNameField: assetName
      };
}

const zoneMapIdField = 'id';
const zoneMapNameField = 'name';
const zoneMapAssetNameField = 'assetName';
