import 'package:chdata/service/search/search_data.dart';
import 'package:chdata/service/search/search_provider.dart';

class SearchService implements SearchProvider {
  final SearchProvider provider;

  const SearchService(this.provider);

  @override
  Future<void> init() async => await provider.init();

  @override
  Future<List<SearchData<T>>> search<T>({
    required String database,
    required String key,
    bool contains = false,
    bool retrieve = false,
  }) async =>
      await provider.search(
          database: database, key: key, contains: contains, retrieve: retrieve);

  @override
  Future<SearchData<T>> searchOne<T>(
          {required String database, required String key}) =>
      provider.searchOne(database: database, key: key);
}
