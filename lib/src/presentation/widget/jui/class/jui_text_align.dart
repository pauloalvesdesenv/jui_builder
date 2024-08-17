import 'package:flutter/material.dart';

class JuiTextAlign {
  final Map<String, dynamic>? data;

  JuiTextAlign(this.data);

  TextAlign build() {
    switch (data?['textAlign']) {
      case 'center':
        return TextAlign.center;
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'justify':
        return TextAlign.justify;
      default:
        return TextAlign.start;
    }
  }
}
