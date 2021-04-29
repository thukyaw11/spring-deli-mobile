import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BuildButton extends StatelessWidget {
  final String type;
  final String svgPath;
  final String routePath;
  BuildButton(
      {Key key,
      @required this.type,
      @required this.svgPath,
      @required this.routePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: (MediaQuery.of(context).size.width / 2) - 20,
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          onPressed: () => {Get.toNamed(routePath)},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                width: 90,
                height: 90,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                type.toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}