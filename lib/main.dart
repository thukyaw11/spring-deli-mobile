import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spring_deli_app/blocs/find_single_rider/find_single_rider_bloc.dart';
import 'package:spring_deli_app/blocs/riders/riders_bloc.dart';
import 'package:spring_deli_app/router.dart';
import 'package:spring_deli_app/services/api/api_service.dart';
import 'package:spring_deli_app/utils.dart';
import 'package:spring_deli_app/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ApiService>(create: (context) => ApiService.create())
        ],
        child: Consumer<ApiService>(builder: (context, apiService, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<RidersBloc>(
                create: (context) => RidersBloc(api: apiService),
              ),
              BlocProvider<FindSingleRiderBloc>(
                  create: (context) => FindSingleRiderBloc())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: RouteGenerator.generateRoute,
              title: appTitle,
              theme: ThemeData(
                fontFamily: 'Baloo',
                primarySwatch: Colors.red,
              ),
              home: HomePage(),
            ),
          );
        }));
  }
}
