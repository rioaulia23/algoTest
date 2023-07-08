import 'package:dio/dio.dart';

import '../../../model/login_model.dart';
import '../../../utils/constant.dart';

class LoginService {
  Future<LoginModel> loginApi(email, password) async {
    LoginModel loginModel = LoginModel(token: '');

    try {
      await Future.delayed(Duration(milliseconds: 500));

      Response response = await Dio().post(
        Api.BASE + Api.LOGIN,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.data != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          loginModel = LoginModel.fromJson(response.data);

          return loginModel;
        }
      }
      return loginModel;
    } on DioError catch (e, stacktrace) {
      print(e.message.toString());
      if (e.response?.data != null) {
        loginModel = LoginModel.fromJson(e.response!.data);
        return loginModel;
      }
      return loginModel;
    }
  }
}
