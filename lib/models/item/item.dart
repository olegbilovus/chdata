import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
class Item {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  Item({required this.id, required this.name, required this.description});
}
