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

  Type get dataType => T.runtimeType;

  const SearchEventSearch({required this.key, required this.contains});
}

class SearchEventShowData<T> extends SearchEvent {
  final String key;

  Type get dataType => T.runtimeType;

  const SearchEventShowData({required this.key});
}
