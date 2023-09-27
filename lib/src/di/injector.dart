import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> injectionApp() async {
  // local data source
//  instance.registerLazySingleton<SignInLocalDataSource>(() => SignInLocalDataSourceImpl());
}
