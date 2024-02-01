import 'dart:convert';

import '../share/constant.dart';
import 'response_base.dart';

class UserModel {
  int? userID;
  String? imagesPaths;
  int? typeUserID;
  String? uUserID;
  String? fullName;
  String? email;
  String? phone;
  int? status;
  int? confirmEmail;
  String? lastLogin;
  String? languageCode;

  static int get getUSerID => GetS.init.read("user_id") ?? 0;
  static void get remoxUserID => GetS.init.remove("user_id");

  UserModel(
      {userID,
      imagesPaths,
      typeUserID,
      uUserID,
      fullName,
      email,
      phone,
      status,
      confirmEmail,
      lastLogin,
      languageCode});

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str) as Map<String, dynamic>);

  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    GetS.init.write("user_id", userID);

    imagesPaths = json['ImagesPaths'];
    typeUserID = json['TypeUserID'];
    uUserID = json['UUserID'];
    fullName = json['FullName'];
    email = json['Email'];
    phone = json['Phone'];
    status = json['Status'];
    confirmEmail = json['ConfirmEmail'];
    lastLogin = json['LastLogin'];
    languageCode = json['LanguageCode'];
  }

  Map<String, dynamic> toUpdateUserJson(fullName, email, phone) {
    final Map<String, dynamic> result = <String, dynamic>{};

    final Map<String, dynamic> auth = <String, dynamic>{};
    auth["UserID"] = GetS.init.read("user_id") ?? "";
    auth["UUSerID"] = "";
    result["auth"] = auth;

    final Map<String, dynamic> data = <String, dynamic>{};
    data["FullName"] = fullName;
    data["Email"] = email;
    data["Phone"] = phone;
    data["LanguageCode"] = "ja";
    data["LastLogin"] = DateTime.now().millisecondsSinceEpoch.toString();

    result["data"] = data;
    return result;
  }

  static ResponseBase<UserModel> getUserResponse(json) {
    if (json["message"] == null) {
      return ResponseBase<UserModel>(data: UserModel.fromJson(json["data"]));
    } else {
      return ResponseBase(message: json["message"]);
    }
  }

  static ResponseBase<bool> getUserUploadAvatarResponse(
      Map<String, dynamic> json) {
    if (json["message"] == null) {
      return ResponseBase<bool>(data: json["data"]);
    } else {
      return ResponseBase(message: json["message"]);
    }
  }
}
