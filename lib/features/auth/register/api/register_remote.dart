import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/app_constants.dart';
import '../models/register_model.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<Either<String, RegisterModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String contactNumber,
    required String role
  });
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  RegisterRemoteDataSource({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, RegisterModel>> register(
      { required String firstName,
        required String lastName,
        required String email,
        required String password,
        required String contactNumber,
        required String role}) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
          AppConstants.register,
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "password": password,
            "contact_number": contactNumber,
            "role": role,
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
        RegisterModel registerModel = RegisterModel.fromJson(json.decode(re.data));
        if (registerModel.user != null) {
          return Right(RegisterModel.fromJson(json.decode(re.data)));
        }  else {
          return  Left(registerModel.message!);
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
