import '../../models/models.dart';
import 'index.dart';

abstract class AuthRepository {
  Future<UserResModel> doLogin(UserReqModel reqModel);
  Future<GetCurrentUser> getCurrentUser();
  Future<void> signOut();
}

class AuthRepositoryImpl extends AuthRepository {
  AuthApiImpl loginApi = AuthApiImpl();

  @override
  Future<UserResModel> doLogin(UserReqModel reqModel) async {
    return await loginApi.doLogin(reqModel);
  }

  @override
  Future<GetCurrentUser> getCurrentUser() async {
    return await loginApi.getCurrentUser();
  }

  @override
  Future<void> signOut() async {
    return await loginApi.signOut();
  }
}
