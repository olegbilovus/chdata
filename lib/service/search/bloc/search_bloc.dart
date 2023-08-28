import 'package:bloc/bloc.dart';
import 'package:chdata/models/mob.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/hive_provider.dart';
import 'package:chdata/service/search/search_provider.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchProvider provider) : super(const SearchStateNotInit()) {
    on<SearchEventInit>((event, emit) async {
      HiveProvider.calledInit = false;
      await provider.init();
      emit(const SearchStateSearching<Mob>(
          isLoading: true, database: mobListField));
      final allResults =
          await provider.search<Mob>(database: mobListField, key: '');
      emit(SearchStateSearching<Mob>(
          results: allResults, isLoading: false, database: mobListField));
    });

    on<SearchEventSearch>((event, emit) async {
      switch (event.database) {
        case mobListField:
          final results = await provider.search<Mob>(
              database: mobListField, key: event.key, contains: event.contains);
          emit(SearchStateSearching<Mob>(
              results: results, isLoading: false, database: mobListField));
      }
    });
  }
}
