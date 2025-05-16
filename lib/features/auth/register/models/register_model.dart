
import '../../login/models/user_model.dart';

class RegisterModel {
  String? message;
  String? type;
  User? user;
  String? accessToken;

  RegisterModel({this.type, this.user, this.accessToken,required  this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    message = json['message']??'';
  }


}


