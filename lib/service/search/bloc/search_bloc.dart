import 'package:bloc/bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/search_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/item/item.dart';
import '../../../models/mob/mob.dart';
import '../../../models/model.dart';
import '../../../models/zone_map/zone_map.dart';
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

      await provider.init();
      final database = prefs.getString(databaseField) ?? mobListField;
      final key = prefs.getString(searchPatternField) ?? '';
      final contains = prefs.getBool(searchContainsField) ?? false;
      switch (database) {
        case mobListField:
          emit(await _searchStateSearching<Mob>(
              database, key, contains, mobModel));
          break;
        case itemListField:
          emit(await _searchStateSearching<Item>(
              database, key, contains, itemModel));
          break;
        case zoneMapListField:
          emit(await _searchStateSearching<ZoneMap>(
              database, key, contains, zoneMapModel));
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
          emit(await _searchStateSearching<Mob>(
              database, key, contains, mobModel));
          break;
        case itemListField:
          emit(await _searchStateSearching<Item>(
              database, key, contains, itemModel));
          break;
        case zoneMapListField:
          emit(await _searchStateSearching<ZoneMap>(
              database, key, contains, zoneMapModel));
          break;
      }
    });

    on<SearchEventShowData>((event, emit) async {
      emit(const SearchStateLoading());
      final database = event.database;
      final key = event.key;
      switch (database) {
        case mobListField:
          emit(await _searchStateShowingData<Mob>(
              database, key, event.back, mobModel));
          break;
        case itemListField:
          emit(await _searchStateShowingData<Item>(
              database, key, event.back, itemModel));
          break;
        case zoneMapListField:
          emit(await _searchStateShowingData<ZoneMap>(
              database, key, event.back, zoneMapModel));
          break;
      }
    });
  }

  Future<SearchStateSearching<T>> _searchStateSearching<T extends Model>(
      String database, String key, bool contains, T model) async {
    final results = await provider.search<T>(
        database: database, key: key, contains: contains, model: model);
    return SearchStateSearching<T>(results: results, database: database);
  }

  Future<SearchStateShowingData<T>> _searchStateShowingData<T extends Model>(
      String database, String key, Back back, T model) async {
    final result =
        await provider.searchOne<T>(database: database, key: key, model: model);
    return SearchStateShowingData<T>(
        database: database, data: result, back: back);
  }
}
