import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:jui_builder/di/injectable.dart';
import 'package:jui_builder/src/presentation/base/base_page.dart';

void main() {
  configureDependencies();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasePage(),
    );
  }
}

// class TestWidget extends StatefulWidget {
//   const TestWidget({super.key});

//   @override
//   State<TestWidget> createState() => _TestWidgetState();
// }

// class _TestWidgetState extends State<TestWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return JsonWidgetData.fromDynamic({
//       "type": "scaffold",
//       "args": {
//         "appBar": {
//           "type": "app_bar",
//           "args": {
//             "title": {
//               "type": "text",
//               "args": {"text": "AnimatedAlign"}
//             }
//           }
//         },
//         "body": {
//           "type": "set_value",
//           "args": {
//             "values": {"customAlign": "topLeft"},
//             "child": {
//               "type": "animated_align",
//               "listen": ["customAlign"],
//               "args": {
//                 "alignment": r"$customAlign",
//                 "duration": 1000,
//                 "child": {
//                   "type": "container",
//                   "args": {"color": "#FF0000", "height": 20, "width": 20}
//                 }
//               }
//             }
//           }
//         },
//         "floatingActionButton": {
//           "type": "elevated_button",
//           "id": "press_me_button",
//           "args": {
//             "onPressed": r"${set_value('customAlign', 'topCenter')}",
//             "child": {
//               "type": "text",
//               "args": {"text": "Press Me!"}
//             }
//           }
//         }
//       }
//     }).build(context: context);
//   }
// }
