import 'dart:async';
import 'dart:developer' as dev;

import 'package:chdata/extensions/buildcontext/loc.dart';
import 'package:chdata/extensions/buildcontext/snackbar.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/search_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/search/bloc/search_bloc.dart';
import 'data_list_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _searchController;
  late final StreamController<List<SearchData>> _streamController;

  Stream<List<SearchData>> get _stream => _streamController.stream;
  List<SearchData> _result = [];
  late bool _contains;
  late String _pattern;
  late String _database;

  @override
  void initState() {
    final prefDatabase = SearchBloc.prefs.getString(databaseField) ?? '';
    if (assetsBoxes.keys.contains(prefDatabase)) {
      _database = prefDatabase;
    } else {
      _database = mobListField;
    }
    _searchController = TextEditingController();
    _pattern = SearchBloc.prefs.getString(searchPatternField) ?? '';
    _searchController.text = _pattern;
    _contains = SearchBloc.prefs.getBool(searchContainsField) ?? false;
    _streamController = StreamController<List<SearchData>>.broadcast(
        onListen: () => _streamController.sink.add(_result));
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchStateSearching) {
          dev.log('Got data');
          _result = state.results ?? [];
          _streamController.add(_result);
        }
      },
      builder: (context, state) {
        dev.log('SearchView: ${state.runtimeType}');
        if (state is SearchStateSearching) {
          _result = state.results ?? [];
          _streamController.add(_result);
          _database = state.database;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(context.loc.app_title),
            actions: [
              DropdownMenu<String>(
                initialSelection: _database,
                onSelected: (String? value) {
                  setState(() {
                    _database = value!;
                  });
                  _refresh(context, _pattern);
                },
                dropdownMenuEntries: assetsBoxes.keys
                    .map<DropdownMenuEntry<String>>(
                        (e) => DropdownMenuEntry<String>(value: e, label: e))
                    .toList(),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autocorrect: false,
                        decoration: InputDecoration(
                            labelText: context.loc.search_search,
                            suffixIcon: const Icon(Icons.search)),
                        onChanged: (value) {
                          _pattern = value;
                          _refresh(context, _pattern);
                        },
                      ),
                    ),
                    Checkbox(
                      value: _contains,
                      onChanged: (value) {
                        if (value ?? false) {
                          context.snack(Text(context.loc.search_contains));
                        } else {
                          context.snack(Text(context.loc.search_not_contains));
                        }
                        setState(() {
                          _contains = value!;
                        });
                        _refresh(context, _pattern);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                  stream: _stream,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          final foundItems =
                              snapshot.data as Iterable<SearchData>;
                          return DataListView(
                              items: foundItems, database: _database);
                        }
                        return Center(child: Text(context.loc.search_empty));
                      default:
                        return const Scaffold(
                            body: Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _refresh(BuildContext context, String pattern) {
    SearchBloc.prefs.setString(databaseField, _database);
    SearchBloc.prefs.setString(searchPatternField, _pattern);
    SearchBloc.prefs.setBool(searchContainsField, _contains);
    context.read<SearchBloc>().add(SearchEventSearch(
        key: pattern, contains: _contains, database: _database));
  }
}
