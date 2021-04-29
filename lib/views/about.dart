import 'package:flutter/material.dart';
import 'package:spring_deli_app/partials/line.dart';
import 'package:spring_deli_app/utils.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: aboutTitlePartOne,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Baloo',
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: aboutTitlePartTwo,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Baloo',
                                color: Theme.of(context).primaryColor))
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  burmeseBelow,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
                BuildLine(),
                Text(
                  aboutInEn,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                BuildLine(),
                Text(
                  aboutInMm,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
