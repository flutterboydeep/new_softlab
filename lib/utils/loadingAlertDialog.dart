import 'package:flutter/material.dart';

loadingAlertDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        content: SizedBox(
            height: 50,
            width: 50,
            child: Center(child: CircularProgressIndicator())),
      );
    },
  );
}
