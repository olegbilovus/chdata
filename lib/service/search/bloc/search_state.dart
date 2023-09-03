import 'package:chdata/service/search/search_data.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SearchState {
  final bool isLoading;
  final String loadingText;

  const SearchState({this.isLoading = false, this.loadingText = 'Loading...'});
}

class SearchStateNotInit extends SearchState {
  const SearchStateNotInit(
      {super.isLoading = true, super.loadingText = 'Loading assets...'});
}

class SearchStateSearching<T> extends SearchState {
  final String key;
  final String database;
  final List<SearchData<T>>? results;

  const SearchStateSearching(
      {required this.database,
      this.results,
      this.key = '',
      super.isLoading,
      super.loadingText});
}

class SearchStateShowingData<T> extends SearchState {
  final String database;
  final SearchData<T> data;

  const SearchStateShowingData(
      {super.isLoading,
      super.loadingText,
      required this.database,
      required this.data});
}
