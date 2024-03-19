import 'package:blink2/core/networking/api_service.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future login({required String email, required String password}) async {
    var response = await apiService.post(
      endPoint: 'login',
      body: {
        'email': email,
        'password': password,
      },
    );
    return response['code'];
  }
}
