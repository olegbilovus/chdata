import 'package:chdata/service/search/bloc/search_bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/search_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataListView extends StatelessWidget {
  final Iterable<SearchData> items;
  final String database;

  const DataListView({super.key, required this.items, required this.database});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final data = items.elementAt(index);
          return ListTile(
            title: Text(
              data.key.split(separator)[0],
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => context.read<SearchBloc>().add(SearchEventShowData(
                key: data.key, database: database, back: _back)),
          );
        },
      ),
    );
  }

  void _back(BuildContext context) {
    context.read<SearchBloc>().add(SearchEventSearch(
        key: SearchBloc.prefs.getString(searchPatternField) ?? '',
        database: database,
        contains: SearchBloc.prefs.getBool(searchContainsField) ?? false));
  }
}
