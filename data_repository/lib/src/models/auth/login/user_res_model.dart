class UserResModel {
  String accessToken;
  String tokenType;
  String expiresAt;

  UserResModel({this.accessToken, this.tokenType, this.expiresAt});

  UserResModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['tokenType'] = this.tokenType;
    data['expiresAt'] = this.expiresAt;
    return data;
  }
}

