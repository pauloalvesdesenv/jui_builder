import 'package:flutter/material.dart';

class JuiTextField extends StatefulWidget {
  final Map<String, dynamic>? data;
  const JuiTextField(this.data, {super.key});

  @override
  State<JuiTextField> createState() => _JuiTextFieldState();
}

class _JuiTextFieldState extends State<JuiTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        label: Text(widget.data?['label']),
        hintText: widget.data?['helperText'],
        border: const OutlineInputBorder(),
      ),
    );
  }
}
