import 'package:blink2/core/networking/api_service.dart';
import 'package:blink2/core/networking/failure.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future login({required String email, required String password}) async {
    try {
      var response = await apiService.post(
        endPoint: 'login',
        body: {
          'email': email,
          'password': password,
        },
      );
      return response['code'];
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDioError(e);
      } else {
        return ServerFailure(e.toString());
      }
    }
  }
}
