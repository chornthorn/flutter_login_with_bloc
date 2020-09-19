import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter_todos_bloc/blocs/authentication/authentication_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository, this.authenticationBloc)
      : super(LoginInitial());

  final AuthRepositoryImpl loginRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      yield LoginLoading();
      UserReqModel reqModel = UserReqModel(
        email: event.data.email,
        password: event.data.password,
      );

      try {
        var result = await loginRepository.doLogin(reqModel);
        if (result != null) {
          authenticationBloc.add(UserLoggedIn(user: result));
        }
        if (result.accessToken.isNotEmpty) {
          yield LoginSuccess(data: result);
          add(GetUserEvent());
        }
      } catch (e) {
        yield LoginFailure(e.toString());
      }
    }
    if (event is GetUserEvent) {
      yield GetUserLoading();
      GetCurrentUser result = await loginRepository.getCurrentUser();
      print(result.email);
      yield GetUserLoaded(data: result);
    }
  }
}
