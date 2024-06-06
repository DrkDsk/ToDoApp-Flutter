import 'package:dio/dio.dart';

class ApiService {

  final Dio dio = Dio();

  Future<String> login(String email, String password) async {
    final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': email,
          'password' : password,
          'expiresInMins' : 1000
        },
        options: Options(
            headers: {'Content-Type': 'application/json'}
        )
    );

    if (response.statusCode == 200) {
      final isValid = response.data["token"];
      return isValid;
    } else {
      return "";
    }
  }

  Future<bool> verifyToken(String token) async {
    final response = await dio.get(
      'https://dummyjson.com/auth/me',
      options: Options(
        headers: {'Authorization': 'Bearer $token'}
      )
    );

    if (response.statusCode == 200) {
      final isValid = response.data['user'];
      return isValid;
    } else {
      return false;
    }
  }
}