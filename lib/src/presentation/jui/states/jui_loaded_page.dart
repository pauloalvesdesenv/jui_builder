import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JuiLoadedPage extends StatefulWidget {
  final Map<String, dynamic> json;
  const JuiLoadedPage({required this.json, super.key});

  @override
  State<JuiLoadedPage> createState() => _JuiLoadedPage();
}

class _JuiLoadedPage extends State<JuiLoadedPage> {

  @override
  Widget build(BuildContext context) {
    return JsonWidgetData.fromDynamic(widget.json,
            registry: JsonWidgetRegistry.instance)
        .build(context: context);
  }
}
