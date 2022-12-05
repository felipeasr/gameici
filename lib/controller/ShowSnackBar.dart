import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String string) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(string),
      duration: const Duration(seconds: 4),
    ),
  );
}
