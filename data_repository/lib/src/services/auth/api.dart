import 'package:data_repository/src/models/auth/get_current_user.dart';
import 'package:data_repository/src/models/auth/login/user_req_model.dart';
import 'package:data_repository/src/models/auth/login/user_res_model.dart';
import 'dart:convert';

import 'package:data_repository/src/networks/networks.dart';

class AuthApi {
  CustomHttp customHttp = new CustomHttp();

  Future<UserResModel> login(UserReqModel reqModel) async {
    var url = '$BASE_URL$LOGIN_PATH';
    var body = json.encode(reqModel);
    final response = await customHttp.postRequest(url, body: body);
    print(response);
    return UserResModel.fromJson(response);
  }

  Future<GetCurrentUser> getUser() async {
    var url = '$BASE_URL$GET_CURRENT_USER';
    final response = await customHttp.getRequest(url, token: ACCESS_TOKEN);
    final currentUser = GetCurrentUser.fromJson(response);
    print(currentUser);
    return currentUser;
  }
}
