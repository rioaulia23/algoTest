part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SuccesLoginState extends LoginState{}
class FailedLoginState extends LoginState{}
