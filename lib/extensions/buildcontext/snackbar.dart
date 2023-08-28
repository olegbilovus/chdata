import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, SnackBar;

extension Localization on BuildContext {
  void snack(Widget content) {
    final snackBar = SnackBar(content: content);
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
