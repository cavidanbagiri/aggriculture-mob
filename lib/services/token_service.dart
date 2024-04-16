
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {

  static Future<String> getToken () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = '';
    var some = prefs.getString('x-auth-token');
    if (some != null) {
      token = some;
    } else {
      print('token is not available');
    }
    return token;
  }

}