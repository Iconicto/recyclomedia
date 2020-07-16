import 'package:dio/dio.dart';
import 'package:recyclomedia/api/api.service.dart';
import 'package:recyclomedia/models/user.model.dart';

class LoginService extends Api {
  Future<User> authenticate(String email, String password) async {
    Dio dio = Dio();
    dio.options.headers['email'] = email;
    dio.options.headers['password'] = password;

    try {
      var response = await dio.get(
        "$Api.BASE_URL/users/me",
      );

      print(response);

      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);

        return user;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
