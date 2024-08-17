import 'package:flutter/material.dart';
import 'package:jui_builder/src/presentation/widget/jui/class/jui_text_align.dart';
import 'package:jui_builder/src/presentation/widget/jui/class/jui_text_style.dart';

class JuiText extends StatelessWidget {
  final Map<String, dynamic> data;
  const JuiText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data['children'].toString(),
      textAlign: JuiTextAlign(data).build(),
      style: JuiTextStyle(data).build(),
    );
  }
}
