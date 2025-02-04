import 'package:flutter/material.dart';

class AppSnackBar {
  static showSnackBarWidget(
      {required BuildContext context,
      required String message,
      Color backColor = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backColor,
        content: Text(
          message,
        ),
      ),
    );
  }
}
