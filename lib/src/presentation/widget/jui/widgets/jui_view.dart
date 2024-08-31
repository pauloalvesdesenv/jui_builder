import 'package:flutter/material.dart';
import 'package:jui_builder/src/presentation/widget/jui/class/jui_axis.dart';
import 'package:jui_builder/src/presentation/widget/jui/class/jui_edge_insets.dart';
import 'package:jui_builder/src/presentation/widget/jui/class/jui_wrap_alignment.dart';

class JuiView extends StatelessWidget {
  final Map<String, dynamic>? style;
  final List<Widget> children;
  const JuiView({required this.children, this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: JuiEdgeInsets.build(style),
      child: Wrap(
        direction: JuiAxis.build(style),
        alignment: JuiWrapAlignment.build(style),
        children: children,
      ),
    );
  }
}
