import 'package:chdata/models/model.dart';

class ZoneMap implements Model {
  @override
  final int id;
  @override
  final String name;
  final String assetName;

  const ZoneMap(
      {required this.id, required this.name, required this.assetName});

  ZoneMap.fromJson(Map<String, dynamic> json)
      : id = json[zoneMapIdField] as int,
        name = json[zoneMapNameField] as String,
        assetName = json[zoneMapAssetNameField] as String;

  @override
  ZoneMap fromJson(Map<String, dynamic> json) => ZoneMap.fromJson(json);

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
