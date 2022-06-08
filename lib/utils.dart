import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Utils {
  static void showSnackBar(
    BuildContext context, {
    required String text,
    required Color color,
  }) =>
      showSimpleNotification(Text(text), background: color);
}
