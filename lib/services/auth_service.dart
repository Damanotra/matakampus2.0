import 'package:flutter/material.dart';
import 'package:matakampus2/locator.dart';
import 'package:matakampus2/resources/provider/api/auth.dart';

class AuthService {
  final _authAPI = locator<AuthAPI>();


  Future<void> login(String email, String password, BuildContext context) async {
    await _authAPI.login(email, password);
  }

  Future<void> logout(BuildContext context) {
    //return _authAPI.logout(context);
  }
}
