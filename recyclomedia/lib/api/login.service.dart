import 'package:dio/dio.dart';
import 'package:recyclomedia/models/user.model.dart';

class LoginService {
  Future<User> authenticate(String email, String password) async {
    print(email);
    print(password);

    Dio dio = Dio();
    dio.options.headers['email'] = 'EdmundFBurrows@dayrep.com';
    dio.options.headers['password'] = 'Esh4uo0aik';

    try {
      var response = await dio.get(
        "https://recyclomedia.iconicto.com/api/user/me",
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
