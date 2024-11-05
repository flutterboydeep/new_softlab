  import 'package:shared_preferences/shared_preferences.dart';





class SharedPreferencesHelper {
  static final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper._ctor();

  factory SharedPreferencesHelper() {
    return _sharedPreferencesHelper;
  }

  SharedPreferencesHelper._ctor();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late SharedPreferences _prefs;

////////////////////////////////////////////////////////////////////////////
///
///
googleAuthTrue()async{
await _prefs.setBool("isGoogleAuth", true);
}
googleAuthFalse()async{
await _prefs.setBool("isGoogleAuth", false);
}


  //set user ID when user log in for the first time
  static void setFirstTime({required bool isFirstTime}) {
    _prefs.setBool('isFirstTime', isFirstTime);
  }

  static dynamic getFirstTime() {

    return _prefs.getBool("isFirstTime");
  }

}