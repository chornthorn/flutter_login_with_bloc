import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/login/user_req_model.dart';
import '../../models/login/user_res_model.dart';

class LoginApi {
  Future<UserResModel> login(UserReqModel reqModel) async {
    try {
      var url = 'http://laravel-forsat.test/api/auth/login';
      var body = json.encode(reqModel);
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };
      http.Response response =
          await http.post(url, body: body, headers: headers);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return UserResModel.fromJson(json.decode(response.body));
      } else {
        print(response.statusCode);
      }
      print(json.decode(response.body));
    } catch (e) {
      print(e);
    }
  }
}
