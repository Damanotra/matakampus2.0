import 'dart:async';
import 'package:matakampus2/models/auth.dart';
import 'package:matakampus2/resources/provider/api/base_api.dart';

class AuthAPI extends BaseAPI {
  Future<void> login(String email, String password) async {
    print('login');
    try {
      final response = await doPost('user/login', {'email': email, 'password':password}, null);
      print('response login : $response');
      final result = AuthToken.fromJson(response as Map);
      await saveAuthToPrefs(result);
    
      return;
    } on APIException catch (err) {
      print(err);
      rethrow;
    }
  }
}
