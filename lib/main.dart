import 'package:chats/src/config/themes/light_theme.dart';
import 'package:chats/src/core/resources/firebase_options.dart';
import 'package:chats/src/data/sources/local/cashe_helper.dart';
import 'package:chats/src/di/bloc_injector.dart';
import 'package:chats/src/di/injector.dart';
import 'package:chats/src/presentation/blocs/home/home_bloc.dart';
import 'package:chats/src/presentation/blocs/internet/internet_bloc.dart';
import 'package:chats/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:chats/src/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:chats/src/presentation/blocs/theme/theme_bloc.dart';
import 'package:chats/src/presentation/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await initModules();
  if (SharedHelper.get(key: 'theme') == null) {
    SharedHelper.save(value: 'Light Theme', key: 'theme');
  }
  runApp(const MyApp());
}

Future<void> initModules() async {
  await SharedHelper.init();
  await injectionApp();
  await blocInjection();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => instance<HomeBloc>()),
        BlocProvider(create: (context) => instance<SignUpBloc>()),
        BlocProvider(create: (context) => instance<SignInBloc>()),
        BlocProvider(create: (context) => instance<InternetBloc>()),
        BlocProvider(create: (context) => instance<ThemeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: startScreen(),
      ),
    );
  }

  Widget startScreen() {
    String? signIn = SharedHelper.get(key: 'uid');

    if (signIn != null) {
      return SplashScreen('home');
    }
    return SplashScreen('logIn');
  }
}

