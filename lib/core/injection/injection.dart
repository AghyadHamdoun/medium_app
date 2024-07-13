import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../constants/app_constants.dart';









final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //!External

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
        () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
          baseUrl: AppConstants.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            requestBody: true,
            responseHeader: true,
            requestHeader: true,
            request: true,
            error: true),
      );

      return dio;
    },
  );

  // sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());

  //datasource
  // sl.registerLazySingleton<LoginRemoteDataSource>(
  //       () => LoginRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  // );
  //


  // bloc
  // sl.registerLazySingleton(() => LoginBloc(loginRemoteDataSource: sl()));






}