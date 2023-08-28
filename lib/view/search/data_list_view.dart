import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/search_data.dart';
import 'package:flutter/material.dart';

class DataListView extends StatelessWidget {
  final Iterable<SearchData> items;

  const DataListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items.elementAt(index);
          return ListTile(
            title: Text(
              item.key.split(separator)[0],
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () async => await showDialog(
              context: context,
              builder: (context) => AlertDialog.adaptive(title: Text(item.key)),
            ),
          );
        },
      ),
    );
  }
}
