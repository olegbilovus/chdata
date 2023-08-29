import 'package:chdata/service/search/search_data.dart';

abstract class SearchProvider {
  Future<void> init();

  Future<List<SearchData<T>>> search<T>({
    required String database,
    required String key,
    bool contains = false,
    bool retrieve = false,
  });

  Future<SearchData<T>> searchOne<T>(
      {required String database, required String key});
}
