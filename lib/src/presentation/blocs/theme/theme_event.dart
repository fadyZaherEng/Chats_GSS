
import 'package:chats/src/core/utils/constants/nums.dart';

abstract class ThemeEvent {}

class GetCurrentThemeEvent extends ThemeEvent {
  final AppTheme appTheme;
  GetCurrentThemeEvent({required this.appTheme});
}

class ThemeChangedEvent extends ThemeEvent {
  final AppTheme theme;
  ThemeChangedEvent({required this.theme});
}
