import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jui_builder/src/presentation/widget/jui/widgets/jui_text.dart';
import 'package:jui_builder/src/presentation/widget/jui/widgets/jui_text_field.dart';
import 'package:jui_builder/src/presentation/widget/jui/widgets/jui_view.dart';

class JuiFactory {
  Widget build(BuildContext context, dynamic component) {
    log(component.toString());
    if (component == null) {
      return Container();
    }
    if (component is List) {
      return Wrap(
        children: List.generate(
            component.length, (index) => build(context, component[index])),
      );
    }
    switch (component[r'$comp']) {
      case 'Text':
        return JuiText(component);
      case 'TextField':
        return JuiTextField(component);
      case 'TextField':
        return JuiTextField(component);
      case 'View':
        return JuiView(
          style: component['style'],
          children: List.generate(component[r'$children'].length,
              (index) => build(context, component[r'$children'][index])),
        );
      default:
        return Container();
    }
  }
}
