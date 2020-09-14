import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/data_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(LoginInitial());

  final LoginRepository loginRepository;

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
        var result = await loginRepository.login(reqModel);
        if (result.accessToken.isNotEmpty) {
          yield LoginSuccess(data: result);
        }
      } catch (e) {
        yield LoginFailure(e.toString());
      }
    }
  }
}
