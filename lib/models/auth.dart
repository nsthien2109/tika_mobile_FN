class AuthModel {
  String? message;
  DataUser? data;
  String? accessToken;
  String? type;

  AuthModel({this.message, this.data, this.accessToken, this.type});

  AuthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
    accessToken = json['accessToken'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['accessToken'] = accessToken;
    data['type'] = type;
    return data;
  }
}

class DataUser {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  int? role;

  DataUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.role
      });

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['email_verified_at'] = emailVerifiedAt;
    data['role'] = role;
    return data;
  }
}