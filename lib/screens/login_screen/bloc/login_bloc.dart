import 'dart:async';

import 'package:algo_test/screens/login_screen/service/login_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginProccessEvent>((event, emit) async {
      emit(await _mapLoginProccess(event));
    });
  }


  LoginModel loginModel = LoginModel(token: '');
  LoginService loginService = LoginService();
  bool isLoading = false;

  Future<LoginState> _mapLoginProccess(LoginProccessEvent event) async {
    isLoading = true;
    loginModel = await loginService.loginApi(
        event.email, event.password);
    if (loginModel.token == null) {
      isLoading = false;
      return FailedLoginState();
    }else{
      isLoading = false;
      return SuccesLoginState();
    }

  }
}
