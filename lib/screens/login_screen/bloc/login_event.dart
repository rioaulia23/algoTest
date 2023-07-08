part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginProccessEvent extends LoginEvent {
  @override
  String toString() => 'LoginProccessEvent';

  final String? email;
  final String? password;


  LoginProccessEvent(
      {this.email,
        this.password,
      });
}
