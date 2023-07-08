import 'dart:async';

import 'package:algo_test/model/home_model.dart';
import 'package:algo_test/screens/home_screen/service/home_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(await _mapGetUser(event));
    });
  }

  HomeModel homeModel = HomeModel(page: 0, perPage: 0, total: 0, totalPages: 0, data: []);
  HomeService homeService = HomeService();
  Future<HomeState> _mapGetUser(GetUserEvent event) async {
    homeModel = await homeService.getUserApi();
    if (homeModel.data.isEmpty) {
      print('tes');
      return FailedGetUserState();
    }
    return SuccesGetUserState();
  }
}
