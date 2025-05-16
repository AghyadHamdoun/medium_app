import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/app_constants.dart';
import '../models/login_model.dart';

abstract class BaseLoginRemoteDataSource {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  LoginRemoteDataSource({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, LoginModel>> login(
      {required String email, required String password}) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
          AppConstants.login,
          data: {
            "email": email,
            "password": password,
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );
        print("re");
        print(re);
        LoginModel loginModel = LoginModel.fromJson(json.decode(re.data));
        if (loginModel.token != null) {
          return Right(LoginModel.fromJson(json.decode(re.data)));
        }  else {
          return  Left(re.statusMessage!);
        }
        
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectionTimeout) {
          return Left(Er.networkError);
        } else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        print(e);
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}
