import 'package:algo_test/screens/login_screen/bloc/login_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/widget_assets.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailLoginController = TextEditingController();
  final _passwordLoginController = TextEditingController();
  LoginBloc? _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _loginBloc,
      builder: (context, state) {
        return BlocListener(
          bloc: _loginBloc,
          listener: (context, state) {
            if (state is SuccesLoginState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else {
              Fluttertoast.showToast(
                  msg: _loginBloc!.loginModel.error.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: AbsorbPointer(
            absorbing: _loginBloc!.isLoading,
            child: Scaffold(
              appBar: AppBar(),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
                child: Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(120)),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: widgetTextForm(_emailLoginController,
                            'Harap isi dengan email yang valid',
                            validatorEmail: true,
                            obscureText: false,
                            hint: 'email'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: widgetTextForm(
                            _passwordLoginController, 'input your password',
                            validatorEmail: false,
                            obscureText: true,
                            hint: 'password'),
                      ),
                      const SizedBox(height: 100,),
                      Container(

                        child:  _loginBloc!.isLoading
                            ? CircularProgressIndicator()
                            : widgetButton(
                            widgetText("Login",
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.w700,
                                color: Colors.white), () {
                          if (_emailLoginController.text.isNotEmpty &&
                              _passwordLoginController.text.isNotEmpty &&
                              _emailLoginController.text.contains('@')) {
                            setState(() {
                              _loginBloc!.add(LoginProccessEvent(
                                email: _emailLoginController.text,
                                password: _passwordLoginController.text,
                              ));
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                "please input a correct email or password",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                            color: Colors.blue,

                            width: MediaQuery.of(context).size.width,
                            height: ScreenUtil().setHeight(40.0)),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
