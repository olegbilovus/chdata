import 'package:flutter/foundation.dart';

@immutable
class SearchData<T> {
  final String key;
  final T? data;

  const SearchData({required this.key, this.data});
}
