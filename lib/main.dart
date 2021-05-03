import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:spring_deli_app/utils.dart';
import 'package:spring_deli_app/views/about.dart';
import 'package:spring_deli_app/views/customer/all_riders.dart';
import 'package:spring_deli_app/views/customer/customer_find_division.dart';
import 'package:spring_deli_app/views/customer/rider_view.dart';
import 'package:spring_deli_app/views/home.dart';
import 'package:spring_deli_app/views/rider/find_rider.dart';
import 'package:spring_deli_app/views/rider/new_rider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/about': (context) => About(),
        '/find_rider': (context) => FindRider(),
        '/new_rider': (context) => NewRider(),
        '/find_division': (context) => FindDivision(),
        '/all_riders': (context) => AllRiders(),
        '/rider_view': (context) => RiderView()
      },
      title: appTitle,
      theme: ThemeData(
        fontFamily: 'Baloo',
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
