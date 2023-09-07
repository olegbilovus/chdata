import 'package:bloc/bloc.dart';
import 'package:chdata/models/mob/mob.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/hive_provider.dart';
import 'package:chdata/service/search/search_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/item/item.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static late final SharedPreferences prefs;

  SearchBloc(SearchProvider provider) : super(const SearchStateNotInit()) {
    on<SearchEventInit>((event, emit) async {
      try {
        prefs = await SharedPreferences.getInstance();
      } on Exception {
        // LateInitializationError
      }

      HiveProvider.calledInit = false;
      await provider.init();
      emit(const SearchStateSearching<Item>(
          isLoading: true, database: itemListField));
      final database = prefs.getString(databaseField) ?? mobListField;
      final key = prefs.getString(searchPatternField) ?? '';
      final contains = prefs.getBool(searchContainsField) ?? false;
      switch (database) {
        case itemListField:
          final allResults = await provider.search<Item>(
              database: database, key: key, contains: contains);
          emit(SearchStateSearching<Item>(
              results: allResults, isLoading: false, database: database));
          break;
        default:
          final allResults = await provider.search<Mob>(
              database: mobListField, key: key, contains: contains);
          emit(SearchStateSearching<Mob>(
              results: allResults, isLoading: false, database: mobListField));
          break;
      }
    });

    on<SearchEventSearch>((event, emit) async {
      final database = event.database;
      final key = event.key;
      final contains = event.contains;
      switch (database) {
        case mobListField:
          final results = await provider.search<Mob>(
              database: database, key: key, contains: contains);
          emit(SearchStateSearching<Mob>(
              results: results, isLoading: false, database: database));
        case itemListField:
          final results = await provider.search<Item>(
              database: database, key: key, contains: contains);
          emit(SearchStateSearching<Item>(
              results: results, isLoading: false, database: database));
      }
    });

    on<SearchEventShowData>((event, emit) async {
      final database = event.database;
      final key = event.key;
      switch (database) {
        case mobListField:
          final result =
              await provider.searchOne<Mob>(database: database, key: key);
          emit(SearchStateShowingData<Mob>(database: database, data: result));
        case itemListField:
          final result =
              await provider.searchOne<Item>(database: database, key: key);
          emit(SearchStateShowingData<Item>(database: database, data: result));
      }
    });
  }
}
