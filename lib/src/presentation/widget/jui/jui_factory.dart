import 'package:flutter/material.dart';

class JuiFactory {
  Widget getWidget(Map<String, dynamic> component){
    switch (component['\$comp']) {
      case 'Text':
        return Text('Text');
      default:
        return Container();
    }
  }
}
