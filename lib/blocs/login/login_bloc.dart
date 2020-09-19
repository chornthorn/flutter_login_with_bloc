import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/data_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(LoginInitial());

  final AuthRepositoryImpl loginRepository;

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
      yield LoggedIn(data: result);
    }
  }
}
