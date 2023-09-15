import 'package:hive/hive.dart';

part 'zone_map.g.dart';

@HiveType(typeId: 9)
class ZoneMap {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String assetName;

  const ZoneMap(
      {required this.id, required this.name, required this.assetName});
}
