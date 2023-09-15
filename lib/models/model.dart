abstract class Model {
  int get id;

  String get name;

  Map<String, dynamic> toJson();

  Model fromJson(Map<String, dynamic> json);
}
