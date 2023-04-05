import 'package:shared_preferences/shared_preferences.dart';

class ShareUtil{
  static SharedPreferences? pref;
  static Future<String?> getFromSharePreference(String key) async{
    pref??=await SharedPreferences.getInstance();
    return pref?.get(key).toString();
  }
  static void setLongData(String key,String value)async{
    pref??=await SharedPreferences.getInstance();
    pref?.setString(key, value);
  }
}
