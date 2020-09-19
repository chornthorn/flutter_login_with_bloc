part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final UserReqModel data;

  Login([this.data]);
}

class GetUserEvent extends LoginEvent {
  final GetCurrentUser data;

  GetUserEvent([this.data]);
}
