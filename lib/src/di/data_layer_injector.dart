// // ignore_for_file: constant_identifier_names
//
// import 'package:dio/dio.dart';
// import 'package:gss/src/data/repositories/remote_repositories/network_info_impl.dart';
// import 'package:gss/src/data/sources/remote/gbu/sign_in/login_service.dart';
// import 'package:gss/src/di/injector.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:gss/src/core/utils/constants/strings.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
// const String APPLICATION_JSON = "application/json";
// const String CONTENT_TYPE = "Content-Type";
// const String ACCEPT = "accept";
// const String AUTHORIZATION = "authorization";
// const String DEFAULT_LANGUAGE = "en";
//
// Future<void> dataLayerInjection() async {
//   // network info
//   instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
//   Dio dio = await getDio();
//   //app service client
//   instance.registerLazySingleton<SignInServiceClient>(() => SignInServiceClient(dio));
// }
//
// Future<Dio> getDio() async {
//   Dio dio = Dio();
//   Map<String, String> headers = {
//     CONTENT_TYPE: APPLICATION_JSON,
//     ACCEPT: APPLICATION_JSON,
//     DEFAULT_LANGUAGE: DEFAULT_LANGUAGE
//   };
//   dio.options = BaseOptions(
//     baseUrl: Constants.BASE_URL,
//     headers: headers,
//   );
//   if (!kReleaseMode) {
//     // its debug mode so print app logs
//     dio.interceptors.add(PrettyDioLogger(
//       requestHeader: true,
//       requestBody: true,
//       responseHeader: true,
//     ));
//   }
//   return dio;
// }