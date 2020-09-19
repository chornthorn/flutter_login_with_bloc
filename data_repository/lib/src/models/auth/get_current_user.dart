class GetCurrentUser {
  int id;
  String firstName;
  String lastName;
  Null bio;
  String email;
  Null emailVerifiedAt;
  Null profilePicture;
  String createdAt;
  String updatedAt;

  GetCurrentUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.bio,
      this.email,
      this.emailVerifiedAt,
      this.profilePicture,
      this.createdAt,
      this.updatedAt});

  GetCurrentUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    bio = json['bio'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profilePicture = json['profile_picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['bio'] = this.bio;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_picture'] = this.profilePicture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
