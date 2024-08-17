import 'package:flutter/material.dart';

class JuiTextStyle {
  final Map<String, dynamic>? data;

  JuiTextStyle(this.data);

  TextStyle build() => TextStyle(
        fontSize: data?['fontSize'],
      );
}
