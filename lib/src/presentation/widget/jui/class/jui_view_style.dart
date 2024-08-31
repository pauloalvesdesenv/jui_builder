import 'package:flutter/material.dart';
import 'package:jui_builder/src/presentation/widget/jui/utils/jui_double_parser.dart';

class JuiTextStyle {
  final Map<String, dynamic>? data;

  JuiTextStyle(this.data);

  TextStyle build() => TextStyle(
        fontSize: JuiDoubleParser.parse(data?['fontSize']),
      );
}
