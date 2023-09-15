import 'package:bloc/bloc.dart';
import 'package:chdata/models/zone/zone_map.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/hive_provider.dart';
import 'package:chdata/service/search/search_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/item/item.dart';
import '../../../models/mob/mob.dart';
import 'constants.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static late final SharedPreferences prefs;
  final SearchProvider provider;

  SearchBloc(this.provider) : super(const SearchStateNotInit()) {
    on<SearchEventInit>((event, emit) async {
      try {
        prefs = await SharedPreferences.getInstance();
      } on Exception {
        // LateInitializationError
      }

      HiveProvider.calledInit = false;
      await provider.init();
      final database = prefs.getString(databaseField) ?? mobListField;
      final key = prefs.getString(searchPatternField) ?? '';
      final contains = prefs.getBool(searchContainsField) ?? false;
      switch (database) {
        case mobListField:
          emit(await _searchStateSearching<Mob>(database, key, contains));
          break;
        case itemListField:
          emit(await _searchStateSearching<Item>(database, key, contains));
          break;
        case zoneListField:
          emit(await _searchStateSearching<ZoneMap>(database, key, contains));
          break;
      }
    });

    on<SearchEventSearch>((event, emit) async {
      emit(const SearchStateLoading());
      final database = event.database;
      final key = event.key;
      final contains = event.contains;
      switch (database) {
        case mobListField:
          emit(await _searchStateSearching<Mob>(database, key, contains));
          break;
        case itemListField:
          emit(await _searchStateSearching<Item>(database, key, contains));
          break;
        case zoneListField:
          emit(await _searchStateSearching<ZoneMap>(database, key, contains));
          break;
      }
    });

    on<SearchEventShowData>((event, emit) async {
      emit(const SearchStateLoading());
      final database = event.database;
      final key = event.key;
      switch (database) {
        case mobListField:
          emit(await _searchStateShowingData<Mob>(database, key, event.back));
          break;
        case itemListField:
          emit(await _searchStateShowingData<Item>(database, key, event.back));
          break;
        case zoneListField:
          emit(await _searchStateShowingData<ZoneMap>(
              database, key, event.back));
          break;
      }
    });
  }

  Future<SearchStateSearching<T>> _searchStateSearching<T>(
      String database, String key, bool contains) async {
    final results = await provider.search<T>(
        database: database, key: key, contains: contains);
    return SearchStateSearching<T>(results: results, database: database);
  }

  Future<SearchStateShowingData<T>> _searchStateShowingData<T>(
      String database, String key, Back back) async {
    final result = await provider.searchOne<T>(database: database, key: key);
    return SearchStateShowingData<T>(
        database: database, data: result, back: back);
  }
}
