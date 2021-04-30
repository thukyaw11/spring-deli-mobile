import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {Key key,
      @required this.textController,
      @required this.labelText,
      this.isMaxLine = false})
      : super(key: key);

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
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
