import 'dart:convert';
import '../../networks/networks.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

abstract class AuthApi {
  Future<UserResModel> doLogin(UserReqModel reqModel);
  Future<GetCurrentUser> getCurrentUser();
}

class AuthApiImpl extends AuthApi {
  CustomHttp customHttp = new CustomHttp();

  @override
  Future<UserResModel> doLogin(UserReqModel reqModel) async {
    var url = '$BASE_URL$LOGIN_PATH';
    var body = json.encode(reqModel);
    final response = await customHttp.postRequest(url, body: body);
    print(response);
    return UserResModel.fromJson(response);
  }

  @override
  Future<GetCurrentUser> getCurrentUser() async {
    var url = '$BASE_URL$GET_CURRENT_USER';
    final response = await customHttp.getRequest(url, token: ACCESS_TOKEN);
    final currentUser = GetCurrentUser.fromJson(response);
    print(currentUser);
    return currentUser;
  }
}
