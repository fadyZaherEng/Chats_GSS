
import 'package:chats/src/core/utils/constants/nums.dart';
import 'package:chats/src/data/sources/local/cashe_helper.dart';
import 'package:chats/src/di/injector.dart';
import 'package:chats/src/presentation/blocs/home/home_bloc.dart';
import 'package:chats/src/presentation/blocs/internet/internet_bloc.dart';
import 'package:chats/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:chats/src/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:chats/src/presentation/blocs/theme/theme_bloc.dart';
import 'package:chats/src/presentation/blocs/theme/theme_event.dart';

Future<void> blocInjection() async {
  instance.registerLazySingleton<HomeBloc>(
    () => HomeBloc()..getUserProfile(),
  );
  instance.registerLazySingleton<SignInBloc>(
    () => SignInBloc(),
  );
  instance.registerLazySingleton<SignUpBloc>(
    () => SignUpBloc(),
  );
  instance.registerLazySingleton<InternetBloc>(
    () => InternetBloc()..workLister(),
  );
  final AppTheme appTheme;
  if (SharedHelper.get(key: 'theme') != null) {
    if (SharedHelper.get(key: 'theme') == 'light') {
      appTheme = AppTheme.LIGHT;
    } else {
      appTheme = AppTheme.DARK;
    }
  } else {
    appTheme = AppTheme.LIGHT;
  }
  instance.registerLazySingleton<ThemeBloc>(
    () => ThemeBloc()
      ..add(
        GetCurrentThemeEvent(
          appTheme: appTheme,
        ),
      ),
  );
}
