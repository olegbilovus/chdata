import 'dart:async';
import 'dart:developer' as dev;

import 'package:chdata/extensions/buildcontext/loc.dart';
import 'package:chdata/extensions/buildcontext/snackbar.dart';
import 'package:chdata/models/mob.dart';
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
  late final StreamController<List<SearchData>> _streamController;

  Stream<List<SearchData>> get _stream => _streamController.stream;
  List<SearchData> _result = [];
  bool _contains = false;
  String _pattern = '';
  String _database = '';

  @override
  void initState() {
    _streamController = StreamController<List<SearchData>>.broadcast(
        onListen: () => _streamController.sink.add(_result));
    super.initState();
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
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'Search',
                            suffixIcon: Icon(Icons.search)),
                        onChanged: (value) {
                          _pattern = value;
                          if (_pattern.isEmpty) {
                            _pattern = '';
                          }
                          _refresh(context, _pattern);
                        },
                      ),
                    ),
                    Checkbox(
                      value: _contains,
                      onChanged: (value) {
                        if (value ?? false) {
                          context.snack(const Text('Filtering any character'));
                        } else {
                          context.snack(
                              const Text('Filtering the first characters'));
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
                          return DataListView(items: foundItems);
                        }
                        return const Center(child: Text('No items'));
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
    switch (_database) {
      case mobListField:
        context.read<SearchBloc>().add(SearchEventSearch<Mob>(
            key: pattern, contains: _contains, database: mobListField));
        break;
    }
  }
}
