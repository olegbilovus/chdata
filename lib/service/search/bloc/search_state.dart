import 'package:chdata/service/search/search_data.dart';
import 'package:flutter/foundation.dart';

import 'constants.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchStateLoading extends SearchState {
  final String loadingText;

  const SearchStateLoading({this.loadingText = 'Loading ...'});
}

class SearchStateNotInit extends SearchState {
  const SearchStateNotInit();
}

class SearchStateSearching<T> extends SearchState {
  final String key;
  final String database;
  final List<SearchData<T>>? results;

  const SearchStateSearching(
      {required this.database, this.results, this.key = ''});
}

class SearchStateShowingData<T> extends SearchState {
  final String database;
  final SearchData<T> data;
  final Back back;

  const SearchStateShowingData(
      {required this.database, required this.data, this.back = doNothing});
}
