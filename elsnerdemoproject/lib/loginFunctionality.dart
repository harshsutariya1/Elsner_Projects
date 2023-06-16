import 'package:elsnerdemoproject/main.dart';
import 'package:elsnerdemoproject/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFunctionality {
  
  
  void saveLoginData(
      {required String username, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("Username", username);
    await preferences.setString("Password", password);
  }

  void checkLoginStatus({required BuildContext ctx}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? username = preferences.getString("Username");
    String? password = preferences.getString("Password");
    if (username == null && password == null) {
      //User is not Loged in.
      preferences.setBool("isLogedin", false);
      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (ctx) => const Welcome()));
    } else {
      //User is Loged in.
      preferences.setBool("isLogedin", true);
      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (context) => const Listview()));
    }
  }

  void clearLoginData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("Username");
    await preferences.remove("Password");
  }
}
