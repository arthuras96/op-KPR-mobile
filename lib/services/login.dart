import "dart:convert";
import "package:remote_lobby/models/user.dart";
import "package:remote_lobby/services/api.dart";
import "package:shared_preferences/shared_preferences.dart";

final String tokenkey =
    "@4u7x!z%C*F-JaNdRgUkXp2s5v8y/B?D(G+KbPeShVmYq3t6w9zC&F)H@McQfTjW";
final String rolekey =
    "@mZq4t7w!zC&F)J@NcRfUjXn2r5u8x/A?D*G-KaPdSgVkYp3s6v9yB&E)H+MbQe";
final String idpersonkey =
    "@ShVmYq3t6w9zB&E)H@McQfTjWnZr4u7x!A%D*F-JaNdRgUkXp2s5v8y/B?E(H+K";
final String usernamekey =
    "@D*G-KaPdSgVkYp3s6v9yB?E(H+MbQeThWmZq4t7w!z%C*F)J@NcRfUjXn2r5u8x";
final String dateexpireskey =
    "@hVmYp3s6v9yB&E)H@McQfTjWnZr4t7w!z%C*F-JaNdRgUkXp2s5v8x/A?D(G+Kb";

class LoginApi {
  Future<bool> login(String username, String password) async {
    Map map = {"username": username, "password": password};

    API api = new API();
    String reply = await api.sendRequestPost("api/users/authenticate", map);

    print(reply);

    if (reply == null) {
      return false;
    }

    final jsonResponse = json.decode(reply);
    User user = new User.fromJson(jsonResponse);

    String expiresIn = DateTime.now().add(new Duration(hours: 10)).toString();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenkey, user.token);
    prefs.setString(rolekey, user.role);
    prefs.setInt(idpersonkey, user.idperson);
    prefs.setString(usernamekey, user.name);
    prefs.setString(dateexpireskey, expiresIn);

    return true;
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String tokenAux = prefs.getString(tokenkey);

    if (tokenAux != null && tokenAux != "") {
      DateTime dateExpiresAux = DateTime.parse(prefs.getString(dateexpireskey));
      DateTime now = DateTime.now();

      if (dateExpiresAux.isBefore(now)) {
        prefs.remove(tokenkey);
        prefs.remove(rolekey);
        prefs.remove(idpersonkey);
        prefs.remove(usernamekey);
        prefs.remove(dateexpireskey);
        return false;
      }

      return true;
    }

    return false;
  }

  Future<bool> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(tokenkey);
      prefs.remove(rolekey);
      prefs.remove(idpersonkey);
      prefs.remove(usernamekey);
      prefs.remove(dateexpireskey);
      return true;
    } catch (e) {
      return false;
    }
  }
}
