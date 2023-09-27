import 'package:flutter/material.dart';

abstract class ThemeState {}
class InitialTheme extends ThemeState{}

class LoadThemeState extends ThemeState {
  final ThemeData themeData;
  LoadThemeState(this.themeData);
}
