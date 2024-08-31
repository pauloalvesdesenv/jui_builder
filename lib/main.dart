import 'package:flutter/material.dart';
import 'package:jui_builder/di/inejctable.dart';
import 'package:jui_builder/src/presentation/jui/jui_page.dart';

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
      home: SafeArea(child: JUIPage()),
    );
  }
}
