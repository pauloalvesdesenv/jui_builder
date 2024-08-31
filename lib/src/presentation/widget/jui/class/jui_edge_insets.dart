import 'package:flutter/material.dart';
import 'package:jui_builder/src/presentation/widget/jui/utils/jui_double_parser.dart';

class JuiEdgeInsets {
  static EdgeInsets build(Map<String, dynamic>? data) {
    if (data == null) return EdgeInsets.zero;
    if (data.containsKey('margin')) {
      return EdgeInsets.all(JuiDoubleParser.parse(data['margin']));
    }
    return EdgeInsets.only(
      top: JuiDoubleParser.parse(data['marginTop']),
      bottom: JuiDoubleParser.parse(data['marginBottom']),
      left: JuiDoubleParser.parse(data['marginLeft']),
      right: JuiDoubleParser.parse(data['marginRight']),
    );
  }
}
