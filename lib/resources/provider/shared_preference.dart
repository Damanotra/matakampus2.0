import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  SharedPreferences prefs;
  static Preference _instance;

  Preference({this.prefs});

  static Future<Preference> getInstance() async {
    if (_instance == null) {
      final prefs = await SharedPreferences.getInstance();
      _instance = Preference(prefs: prefs);
    }
    return _instance;
  }

  String getToken() {
    print("token="+prefs.getString('token'));
    return prefs.getString('token');
  }

  void setToken(String token) async {
    print('SET TOKEN = $token');
    await prefs.setString('token', token);
  }
  
  Future<void> logout() async {
    await prefs.remove('token');
  }
}
