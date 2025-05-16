

import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/key_constants.dart';


 class Preferences {
  static SharedPreferences? preferences;


  static init() async {

        preferences = await SharedPreferences.getInstance();

  }

  static void saveIsFirstTime(bool isFirstTime) async {
    preferences!.setBool(KeyConstants.keyIsFirstTime, isFirstTime);

  }
  static bool? getIsFirstTime() {
    bool? first = preferences!.getBool(KeyConstants.keyIsFirstTime);
    if(first==null)
    {
      return true;
    }
    else
      return first;
  }

  static void saveUserToken(String userToken) async {
    preferences!.setString(KeyConstants.keyToken, userToken);
  }

  static String? getUserToken() {
    String? userToken = preferences!.getString(KeyConstants.keyToken);
    if(userToken==null)
    {
      return '';
    }
    else {
      return userToken;
    }
  }

  static void saveUserName(String userName) async {
    preferences!.setString(KeyConstants.keyUserName, userName);
  }

  static String? getUserName() {
    String? userName = preferences!.getString(KeyConstants.keyUserName);
    if(userName==null)
    {
      return '';
    }
    else {
      return userName;
    }
  }

  static void saveUserId(int userId) async {
    preferences!.setInt(KeyConstants.keyUserId, userId);
  }

  static int? getUserId() {
    int? userId = preferences!.getInt(KeyConstants.keyUserId);
    if(userId==null)
    {
      return 0;
    }
    else {
      return userId;
    }
  }

  static void saveUserImage(String image) async {
    preferences!.setString(KeyConstants.keyImage, image);
  }

  static String? getUserImage() {
    String? userImage = preferences!.getString(KeyConstants.keyImage);
    if(userImage==null)
    {
      return '';
    }
    else {
      return userImage;
    }
  }

}
