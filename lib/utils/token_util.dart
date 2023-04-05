import 'package:mixedgpt/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil{
  static Future<bool> isLogin() async{
    String? token = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token');
    if(token==null||token==''){
      return false;
    }
    return true;
  }
  static saveLoginInfo(UserModel model) async{

  }
  static clearUserInfo() async{

  }
  static Future<Map<String,dynamic>> getUserInfo() async{
    return {};
  }

  static Future<String> getToken()async{
    return '';
  }
}