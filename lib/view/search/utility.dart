import 'package:flutter/material.dart';

import 'constants.dart';

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
