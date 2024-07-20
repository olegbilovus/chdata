import 'package:chdata/utilities/alg/binary_search_occurrences.dart';
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
    textScaler: const TextScaler.linear(1.5),
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

typedef GetSubTitle = Text? Function(dynamic element);
typedef OnTap = void Function(dynamic element);

List<Widget> createList(
  BuildContext context,
  String header,
  List items,
  IconData icon,
  OnTap onTap, {
  required GetKey getTitle,
  GetSubTitle? getSubTitle,
}) {
  final children = <Widget>[];

  children.add(createHeader(header));
  children.add(const SizedBox(height: 10));
  children.add(
    SizedBox(
      height: (MediaQuery.of(context).size.height / 7) *
          (1 + (items.length * 0.002)),
      child: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final data = items.elementAt(index);
            return ListTile(
              title: Text(getTitle(data),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center),
              subtitle: getSubTitle != null ? getSubTitle(data) : null,
              trailing: Icon(icon),
              onTap: () => onTap(data),
            );
          },
        ),
      ),
    ),
  );
  children.add(const Divider(thickness: dividerThickness));

  return children;
}

String getTimeFromSeconds(int seconds) {
  final duration = Duration(seconds: seconds);
  var str = '';
  if (duration.inDays > 0) {
    str += '${duration.inDays.remainder(60)} days ';
  }
  if (duration.inHours > 0) {
    str += '${duration.inHours.remainder(60)} hours ';
  }
  if (duration.inMinutes > 0) {
    str += '${duration.inMinutes.remainder(60)} minutes ';
  }
  final timerSeconds = duration.inSeconds.remainder(60);
  if (timerSeconds > 0) {
    str += '$timerSeconds seconds';
  }

  return str;
}
