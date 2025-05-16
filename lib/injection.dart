import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_bloc.dart';
import 'core/constant/app_constants.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/login/api/login_remote.dart';
import 'features/auth/register/api/register_remote.dart';

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
          connectTimeout: const Duration(seconds: 12),
          receiveTimeout: const Duration(seconds: 12),
          sendTimeout: const Duration(seconds: 12),
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

  sl.registerLazySingleton(() => DataConnectionChecker());

  // sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  //
  // //datasource
  sl.registerLazySingleton<BaseLoginRemoteDataSource>(
    () => LoginRemoteDataSource(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
    () => RegisterRemoteDataSource(dio: sl(), networkInfo: sl()),
  );

  // Bloc

  sl.registerLazySingleton(() =>
      AuthBloc(loginRemoteDataSource: sl(), registerRemoteDataSource: sl()));

  sl.registerLazySingleton(() =>
      AddArticleBloc());
}
