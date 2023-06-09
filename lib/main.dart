import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/presentation/routes/routes.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developers ATL',
      theme: ThemeData(
          primarySwatch: primarySwatch,
          textTheme: TextTheme().apply(bodyColor: darkColor, displayColor: darkColor),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontWeight: FontWeight.bold)))),
          appBarTheme: AppBarTheme(
              backgroundColor: offWhiteColor,
              foregroundColor: primaryColor,
              iconTheme: IconThemeData(color: primaryColor))),
      onGenerateRoute: (settings) {
        for (var route in routes) {
          if (route.matches(settings)) {
            return route.build(settings);
          }
        }
        return routes.first.build(RouteSettings(name: '/'));
      },
    );
  }
}
