import 'dart:convert';
import '../../networks/networks.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

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
