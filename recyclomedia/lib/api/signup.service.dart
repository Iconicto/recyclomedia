import 'package:dio/dio.dart';
import 'package:recyclomedia/api/api.service.dart';
import 'package:recyclomedia/constants/run_mode.constants.dart';
import 'package:recyclomedia/models/user.model.dart';

class SignUpService extends Api {
  Future<bool> register(String email, String username, String password) async {
    if (RunMode.mode == "DEBUG") {
      return true;
    } else {
      Dio dio = Dio();
      dio.options.headers['content-type'] = 'multipart/form-data';

      try {
        var response = await dio.post(
          "$Api.BASE_URL/users/",
          data: FormData.fromMap(
            {"email": email, "username": username, "password": password},
          ),
        );

        if (response.statusCode == 201) {
          User user = User.fromJson(response.data);
          if (user != null) {
            return true;
          }
          return false;
        } else {
          return false;
        }
      } catch (error) {
        print(error);
        return false;
      }
    }
  }
}
