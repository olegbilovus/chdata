import 'package:chdata/service/search/search_data.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SearchState {
  final bool isLoading;
  final String? loadingText;

  const SearchState({this.isLoading = false, this.loadingText = 'Loading...'});
}

class SearchStateNotInit extends SearchState {
  const SearchStateNotInit(
      {super.isLoading = true, super.loadingText = 'Loading assets...'});
}

class SearchStateSearching<T> extends SearchState {
  Type get dataType => T.runtimeType;

  const SearchStateSearching({super.isLoading, super.loadingText});
}

class SearchStateSearchResult<T> extends SearchState {
  final List<SearchData<T>> results;

  Type get dataType => T.runtimeType;

  const SearchStateSearchResult(
      {required this.results, super.isLoading, super.loadingText});
}
