import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_deli_app/partials/build_button.dart';
import 'package:spring_deli_app/partials/line.dart';
import 'package:spring_deli_app/utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/main_photo.png'))),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    BuildButton(
                      type: 'rider',
                      svgPath: 'svgs/rider.svg',
                      routePath: '/find_rider',
                    ),
                    BuildButton(
                      type: 'customer',
                      svgPath: 'svgs/customer.svg',
                      routePath: '/find_division',
                    ),
                  ],
                ),
                BuildLine(),
                InkWell(
                  onTap: () => Get.toNamed('/about'),
                  child: Text(
                    "Learn more about Spring Delivery",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
