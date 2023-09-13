import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/mob/constants.dart';
import 'constants.dart';

String numFormatter(dynamic number) {
  if (number == immuneValue) {
    return immuneText;
  }
  return NumberFormat.decimalPattern().format(number);
}

List<Widget> createSection(String header, Map<String, String> data,
    {bool showAll = false}) {
  final list = <Widget>[];
  final columnData = createData(data, showAll: showAll);
  if (columnData.children.isNotEmpty) {
    list.add(createHeader(header));
    list.add(columnData);
    list.add(const Divider(thickness: dividerThickness));
  }

  return list;
}

Widget createHeader(String text) {
  return Text(
    text,
    textScaleFactor: 1.5,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

Column createData(Map<String, String> data, {bool showAll = false}) {
  final List<Widget> children = [];
  data.forEach((key, value) {
    if (showAll || !emptyValues.contains(value)) {
      children.add(Wrap(
        spacing: widthSB,
        children: [
          key.isNotEmpty
              ? Text('$key:', style: textStyleField)
              : const SizedBox(),
          Text(value),
        ],
      ));
    }
  });

  return Column(
    children: children,
  );
}
