part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class SuccesGetUserState extends HomeState{}
class FailedGetUserState extends HomeState{}
