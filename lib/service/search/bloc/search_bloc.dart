import 'package:bloc/bloc.dart';
import 'package:chdata/models/mob.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/search_provider.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchProvider provider) : super(const SearchStateNotInit()) {
    on<SearchEventInit>((event, emit) async {
      await provider.init();
      emit(const SearchStateSearching<Mob>());
      final allResults =
          await provider.search<Mob>(database: mobListField, key: '');
      emit(SearchStateSearchResult<Mob>(results: allResults, isLoading: false));
    });
  }
}
