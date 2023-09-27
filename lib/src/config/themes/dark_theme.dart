// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme()=>ThemeData(
  scaffoldBackgroundColor: HexColor('000028'),
  appBarTheme:  AppBarTheme(
    backgroundColor: HexColor('00028'),
    elevation: 0,
    titleTextStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('000028'),
      statusBarIconBrightness: Brightness.light,
    ),
    iconTheme: const IconThemeData(
      color: Colors.blueAccent,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.blueAccent,
    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blueAccent,
    backgroundColor:HexColor('000028'),
    unselectedItemColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white,
    ),
    caption: TextStyle(
      color: Colors.white,
    ),
  ),
  cardTheme: CardTheme(
    color:HexColor('180040') ,
  ),
  hintColor: Colors.white,
  brightness: Brightness.dark,
  primaryColor:  Colors.white,
  drawerTheme: DrawerThemeData(
    backgroundColor: HexColor('000028'),
  ),
);
