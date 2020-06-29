import 'package:dio/dio.dart';
import 'package:recyclomedia/models/user.model.dart';

class SignUpService {
  Future<bool> register(String email, String username, String password) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'multipart/form-data';

    print(email);
    print(username);
    print(password);

    try {
      var response = await dio.post(
        "https://recyclomedia.iconicto.com/api/users/",
        data: FormData.fromMap(
          {"email": email, "username": username, "password": password},
        ),
      );

      if (response.statusCode == 201) {
        User user = User.fromJson(response.data);
        print(user.toString());
        return true;
      } else {
        print(response.statusCode);
        print(response.data);
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
}
