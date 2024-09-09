import 'package:e_commerce_app/models/user.dart';
import 'package:e_commerce_app/services/http_service.dart';

class AuthService {
  static late final AuthService _singleton = AuthService._internal();

  final _httpService = HttpService();

  User? user;

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();

  Future<bool> login(String username, String password) async {
    try {
      var response = await _httpService
          .post('auth/login', {"username": username, "password": password});

      print(response?.statusCode);

      if (response?.statusCode == 200 && response?.data != null) {
        user = User.fromJson(response!.data);

        HttpService().setup(bearerToken: user!.token);
        return true;
      }
      print(response!.data);
    } catch (e) {
      print(e);
    }
    return true;
  }
}
