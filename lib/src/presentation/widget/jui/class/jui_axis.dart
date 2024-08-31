import 'package:flutter/material.dart';

class JuiAxis {
  static Axis build(Map<String, dynamic>? data) {
    if (data == null) return Axis.horizontal;
    if (data.containsKey('flexDirection')) {
      return data['flexDirection'] == 'vertical'
          ? Axis.vertical
          : Axis.horizontal;
    }
    return Axis.horizontal;
  }
}
