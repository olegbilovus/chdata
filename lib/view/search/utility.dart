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

Widget createHeader(String text) {
  return Text(
    text,
    textScaleFactor: 1.5,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget createData(Map<String, String> data) {
  final List<Widget> children = [];
  data.forEach((key, value) {
    children.add(Wrap(
      spacing: widthSB,
      children: [
        key.isNotEmpty
            ? Text('$key:', style: textStyleField)
            : const SizedBox(),
        Text(value),
      ],
    ));
  });

  return Column(
    children: children,
  );
}
