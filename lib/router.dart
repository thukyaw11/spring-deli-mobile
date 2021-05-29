import 'package:flutter/cupertino.dart';
import 'package:spring_deli_app/views/about.dart';
import 'package:spring_deli_app/views/customer/all_riders.dart';
import 'package:spring_deli_app/views/customer/customer_find_division.dart';
import 'package:spring_deli_app/views/customer/rider_view.dart';
import 'package:spring_deli_app/views/errorPage.dart';
import 'package:spring_deli_app/views/rider/find_rider.dart';
import 'package:spring_deli_app/views/rider/new_rider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/findRider':
        return CupertinoPageRoute(builder: (_) => FindRider());
      case '/newRider':
        return CupertinoPageRoute(builder: (_) => NewRider());
      case '/about':
        return CupertinoPageRoute(builder: (_) => About());
      case '/allRiders':
        return CupertinoPageRoute(
            builder: (_) => AllRiders(
                  selectedTownship: arguments.toString(),
                ));
      case '/customerFindRider':
        return CupertinoPageRoute(builder: (_) => FindDivision());
      case '/riderView':
        return CupertinoPageRoute(builder: (_) => RiderView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return ErrorPage();
    });
  }
}
