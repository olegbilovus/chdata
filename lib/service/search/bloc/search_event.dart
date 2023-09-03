import 'package:flutter/foundation.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class SearchEventInit extends SearchEvent {
  const SearchEventInit();
}

class SearchEventSearch<T> extends SearchEvent {
  final String key;
  final bool contains;
  final String database;

  const SearchEventSearch(
      {required this.key, required this.contains, required this.database});
}

class SearchEventShowData<T> extends SearchEvent {
  final String key;
  final String database;

  const SearchEventShowData({required this.key, required this.database});
}
