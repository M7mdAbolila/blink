import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://blink-blog-website.glitch.me/api/';

  final Dio _dio;
  ApiService(this._dio);
  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'api_key': "ElGamdeeeenFash5",
  };
  Future post({required String endPoint,required Map<String,dynamic> body}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
      data: body,
    );
    return response.data;
  }
}
