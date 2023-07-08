import 'package:algo_test/model/home_model.dart';
import 'package:dio/dio.dart';

import '../../../utils/constant.dart';

class HomeService {
  Future<HomeModel> getUserApi() async {
    HomeModel homeModel =
        HomeModel(page: 0, perPage: 0, total: 0, totalPages: 0, data: []);
    try {
      await Future.delayed(Duration(milliseconds: 500));

      Response response = await Dio().get(
        Api.BASE + Api.USER,
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.data != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          homeModel = HomeModel.fromJson(response.data);
          return homeModel;
        }
      }
      return homeModel;
    } on DioError catch (e, stacktrace) {
      print(e.message.toString());
      if (e.response?.data != null) {
        homeModel = HomeModel.fromJson(e.response!.data);
        return homeModel;
      }
      return homeModel;
    }
  }
}
