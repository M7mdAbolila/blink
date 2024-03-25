import 'package:blink2/core/networking/api_service.dart';
import 'package:blink2/core/networking/failure.dart';
import 'package:blink2/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepoImpl implements SignUpRepo {
  final ApiService apiService;

  SignUpRepoImpl(this.apiService);
  @override
  Future<Either<Failure, dynamic>> addUser({
    required String email,
    required String password,
    required String username,
    required String phone,
    required DateTime dob,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: 'users',
        body: {
          'email': email,
          'password': password,
          'username': username,
          'phone': phone,
          'DOB': dob,
        },
      );
      return right(response['code']);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> userValidate({
    required String email,
    required String username,
    required String phone,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: 'users/validate',
        body: {
          'email': email,
          'username': username,
          'phone': phone,
        },
      );
      return right(response['code']);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> emailValidate({
    required String email,
    required String secretCode,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: 'users/email-check',
        body: {
          'secret': int.parse(secretCode),
          'email': email,
        },
      );
      return right(response['code']);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
