import 'dart:developer' as dev;

import 'package:chdata/service/search/bloc/search_bloc.dart';
import 'package:chdata/service/search/bloc/search_event.dart';
import 'package:chdata/service/search/bloc/search_state.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/view/search/utility.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item/item.dart';
import 'constants.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        state as SearchStateShowingData<Item>;
        final data = state.data;
        dev.log('ItemView: ${data.key}');
        return WillPopScope(
          onWillPop: () {
            _back(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
                title: Text(data.data!.name),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _back(context),
                )),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    createHeader('Description'),
                    createData({'': data.data!.description}),
                    const Divider(thickness: dividerThickness),
                    createHeader('Base stats'),
                    createData({
                      'Slot': data.data!.equipmentSlot.name.capitalize,
                      'Sub type': data.data!.subType.name.capitalize,
                      'No trade': data.data!.noTrade.toString().capitalize,
                      'Stackable': data.data!.stackable.toString().capitalize,
                      'Weight': data.data!.weight.toString(),
                      'Buy': data.data!.buy.toString(),
                      'Sell': data.data!.sell.toString()
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _back(BuildContext context) {
    context.read<SearchBloc>().add(SearchEventSearch(
        key: SearchBloc.prefs.getString(searchPatternField) ?? '',
        database: itemListField,
        contains: SearchBloc.prefs.getBool(searchContainsField) ?? false));
  }
}
