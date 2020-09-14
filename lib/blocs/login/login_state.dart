part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}

class LoginSuccess extends LoginState {
  final UserResModel data;

  LoginSuccess({this.data});
}
