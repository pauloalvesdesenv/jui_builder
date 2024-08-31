import 'package:flutter/material.dart';

class JuiWrapAlignment {
  static WrapAlignment build(Map<String, dynamic>? data) {
    if (data == null) return WrapAlignment.start;
    if (data.containsKey('alignContent')) {
      switch (data['alignContent']) {
        case 'start':
          return WrapAlignment.start;
        case 'end':
          return WrapAlignment.end;
        case 'center':
          return WrapAlignment.center;
        case 'spaceBetween':
          return WrapAlignment.spaceBetween;
        case 'spaceAround':
          return WrapAlignment.spaceAround;
        case 'spaceEvenly':
          return WrapAlignment.spaceEvenly;
        default:
          return WrapAlignment.start;
      }
    }
    return WrapAlignment.start;
  }
}
