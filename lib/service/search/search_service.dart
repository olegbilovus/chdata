import 'package:chdata/service/search/search_data.dart';
import 'package:chdata/service/search/search_provider.dart';

import '../../models/model.dart';

class SearchService implements SearchProvider {
  final SearchProvider provider;

  const SearchService(this.provider);

  @override
  Future<void> init() async => await provider.init();

  @override
  Future<List<SearchData<T>>> search<T extends Model>(
          {required String database,
          required String key,
          bool contains = false,
          bool retrieve = false,
          required T model}) async =>
      await provider.search<T>(
          database: database,
          key: key,
          contains: contains,
          retrieve: retrieve,
          model: model);

  @override
  Future<SearchData<T>> searchOne<T extends Model>(
          {required String database, required String key, required T model}) =>
      provider.searchOne<T>(database: database, key: key, model: model);
}
