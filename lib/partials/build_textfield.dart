import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {required this.textController,
      required this.labelText,
      this.isMaxLine = false});

  final TextEditingController textController;
  final String labelText;
  final bool isMaxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        maxLines: isMaxLine ? 5 : null,
        controller: textController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: labelText,
          fillColor: Colors.black12,
          filled: true,
        ),
      ),
    );
  }
}
