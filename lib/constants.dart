library constants;

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var log = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 3,
  colors: true,
  printTime: false,
  printEmojis: true,
));

// Colors
Map<int, Color> color = {
  50: Color.fromRGBO(3, 115, 140, .1),
  100: Color.fromRGBO(3, 115, 140, .2),
  200: Color.fromRGBO(3, 115, 140, .3),
  300: Color.fromRGBO(3, 115, 140, .4),
  400: Color.fromRGBO(3, 115, 140, .5),
  500: Color.fromRGBO(3, 115, 140, .6),
  600: Color.fromRGBO(3, 115, 140, .7),
  700: Color.fromRGBO(3, 115, 140, .8),
  800: Color.fromRGBO(3, 115, 140, .9),
  900: Color.fromRGBO(3, 115, 140, 1),
};
MaterialColor primarySwatch = MaterialColor(0xff03738c, color);
Color primaryColor = Color(0xff03738c);
Color primaryDarkColor = Color(0xff00475f);
Color primaryLightColor = Color(0xff4da2bc);
Color accentColor = Color(0xff024959);
Color greyColor = Color(0xffa3babf);
Color offWhiteColor = Color(0xfff2f2f2);
Color darkColor = Color(0xff011F26);
