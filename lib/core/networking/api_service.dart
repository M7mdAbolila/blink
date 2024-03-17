import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://blink-blog-website.glitch.me/api/';

  final Dio _dio;
  ApiService(this._dio);

  Future post({required String endPoint}) async {
    var response = await _dio.post('$_baseUrl$endPoint');
    return response.data;
  }
}
