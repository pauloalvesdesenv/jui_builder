import 'package:flutter/material.dart';
import 'package:jui_builder/src/domain/utils/strings.dart';
import 'package:jui_builder/src/presentation/widget/jui/class/jui_text_align.dart';
import 'package:jui_builder/src/presentation/widget/jui/class/jui_text_style.dart';
import 'package:jui_builder/src/presentation/widget/jui/jui_storage.dart';
import 'package:jui_builder/src/presentation/widget/jui/utils/jui_double_parser.dart';

class JuiText extends StatelessWidget {
  final Map<String, dynamic> data;
  const JuiText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: JuiDoubleParser.parse(data['style']?['marginBottom']),
        left: JuiDoubleParser.parse(data['style']?['marginLeft']),
        right: JuiDoubleParser.parse(data['style']?['marginRight']),
        top: JuiDoubleParser.parse(data['style']?['marginTop']),
      ),
      child: Text(
        getTextValue(),
        textAlign: JuiTextAlign(data).build(),
        style: JuiTextStyle(data['style']).build(),
      ),
    );
  }

  String getTextValue() {
    if (data[r'$children'] == null) return empty;
    if (data[r'$children'] is String) return data[r'$children'].toString();
    if (data[r'$children'][r'$modifier'] == 'get') {
      return JuiStorage.get(data[r'$children']['store'], data[r'$children']['path']);
    }

    return data[r'$children'].join('');
  }
}
