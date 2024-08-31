import 'package:flutter/widgets.dart';
import 'package:jui_builder/src/presentation/widget/jui/jui_factory.dart';

class JuiLoadedPage extends StatefulWidget {
  final dynamic json;
  const JuiLoadedPage({required this.json, super.key});

  @override
  State<JuiLoadedPage> createState() => _JuiLoadedPage();
}

class _JuiLoadedPage extends State<JuiLoadedPage> {
  @override
  Widget build(BuildContext context) {
    return JuiFactory().build(context, widget.json);
  }
}
