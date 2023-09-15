import 'package:chdata/service/search/search_data.dart';

import '../../models/model.dart';

abstract class SearchProvider {
  Future<void> init();

  Future<List<SearchData<T>>> search<T extends Model>(
      {required String database,
      required String key,
      bool contains = false,
      bool retrieve = false,
      required T model});

  Future<SearchData<T>> searchOne<T extends Model>(
      {required String database, required String key, required T model});
}
