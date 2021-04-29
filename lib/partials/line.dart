import 'package:flutter/material.dart';

class BuildLine extends StatelessWidget {
  const BuildLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1.0,
      color: Colors.black12,
      width: double.infinity,
    );
  }
}
