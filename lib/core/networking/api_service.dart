import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://51.21.147.29/api/v1/';

  final Dio _dio;
  ApiService(this._dio);
  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'api_key': "ElGamdeeeenFash5",
  };
  // Future<Map<String, dynamic>>
  Future post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
      data: body,
    );
    return response.data;
  }
}
