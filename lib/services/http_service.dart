import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants.dart';

class HttpService {
  static final HttpService _singleton = HttpService._internal();

  final _dio = Dio();

  factory HttpService() {
    return _singleton;
  }

  HttpService._internal() {
    setup();
  }

  Future<void> setup({String? bearerToken}) async {
    final headers = {
      "Content-Type": "application/json",
    };

    if (bearerToken != null) {
      headers["Authorization"] = "Bearer $bearerToken";
    }

    final options = BaseOptions(
      baseUrl: API_BASE_URL,
      headers: headers,
      validateStatus: (status) {
        if (status == null) return false;
        return status < 500;
      },
    );
    _dio.options = options;
  }

  //POST request to login and get token
  Future<Response?> post(String path, Map data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<Response?> get(String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            'Request failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred during the GET request: $e');
      return null;
    }
  }
}
