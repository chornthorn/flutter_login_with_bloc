import '../../models/login/user_req_model.dart';
import '../../models/login/user_res_model.dart';
import 'index.dart';

class LoginRepository {
  LoginApi loginApi = LoginApi();

  Future<UserResModel> login(UserReqModel reqModel) async {
    return await loginApi.login(reqModel);
  }
}
