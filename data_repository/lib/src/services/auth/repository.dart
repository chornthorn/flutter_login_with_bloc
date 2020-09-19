import '../../models/models.dart';
import 'index.dart';

class LoginRepository {
  AuthApi loginApi = AuthApi();

  Future<UserResModel> login(UserReqModel reqModel) async {
    return await loginApi.login(reqModel);
  }

  Future<GetCurrentUser> getUser() async {
    return await loginApi.getUser();
  }
}
