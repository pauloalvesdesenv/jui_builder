import 'package:flutter/material.dart';

class JuiEdit extends StatefulWidget {
  final Map<String, dynamic>? data;
  const JuiEdit(this.data, {super.key});

  @override
  State<JuiEdit> createState() => _JuiEditState();
}

class _JuiEditState extends State<JuiEdit> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            label: Text(widget.data?['label']),
            hintText: widget.data?['helperText'],
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
