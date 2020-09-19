import 'package:data_repository/src/models/auth/get_current_user.dart';
import 'package:data_repository/src/models/auth/login/user_req_model.dart';
import 'package:data_repository/src/models/auth/login/user_res_model.dart';
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
