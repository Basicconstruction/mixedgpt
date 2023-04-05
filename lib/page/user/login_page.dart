import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixedgpt/call/call.dart';
import 'package:mixedgpt/call/notify.dart';
import 'package:mixedgpt/component/big_button.dart';
import 'package:mixedgpt/component/item_text_field.dart';
import 'package:mixedgpt/component/logo_container.dart';
import 'package:mixedgpt/component/show_message.dart';
import 'package:mixedgpt/config/api_url.dart';
import 'package:mixedgpt/config/color.dart';
import 'package:mixedgpt/config/string.dart';
import 'package:mixedgpt/model/user_model.dart';
import 'package:mixedgpt/service/http_service.dart';
import 'package:mixedgpt/utils/router_util.dart';
import 'package:mixedgpt/utils/token_util.dart';

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState(){
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  TextEditingController? _supplierController;
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  final FocusNode _supplierNode = FocusNode();
  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  @override
  void initState(){
    super.initState();
    _supplierController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MColor.primaryColor,
        elevation: 0,
        title: const Text(MString.loginTitle),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LogoContainer(),
            const SizedBox(
              height: 80,
            ),
            _textInputContent(context),
            const SizedBox(height: 20,),
            MBigButton(
              text: MString.loginTitle,
              onPressed: (){
                if(_checkInput()){
                  _login();
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _forgetPasswordButton(),
                _registerButton()
              ],
            )
          ],
        ),
      )
    );
  }
  Widget _textInputContent(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: <Widget>[
          ItemTextField(
            icon: Icon(Icons.support_agent),
            controller: _supplierController,
            focusNode: _supplierNode,
            title: MString.supplier,
            hintText: MString.pleaseInputSupplier,
          ),
          const SizedBox(height: 20.0,),
          ItemTextField(icon: const Icon(Icons.person),
            controller: _usernameController,
            focusNode: _usernameNode,
            title: MString.userTitle,
            hintText: MString.pleaseInputUsername,
          ),
          const SizedBox(height: 20.0,),
          ItemTextField(icon: const Icon(Icons.lock),
            controller: _passwordController,
            focusNode: _passwordNode,
            title: MString.passwordTitle,
            hintText: MString.pleaseInputPassword,
            obscureText: true,
          ),
          const SizedBox(height: 20.0,),
        ],
      ),
    );
  }
  Widget _forgetPasswordButton(){
    return Container(
      margin: const EdgeInsets.all(40.0),
      child: const InkWell(
        child: Text(
          MString.forgetPassword,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18
          ),
        ),
      ),
    );
  }
  Widget _registerButton(){
    return Container(
      margin: const EdgeInsets.all(40.0),
      child: InkWell(
        onTap: (){
          RouterUtil.toRegisterPage(context);
        },
        child: const Text(
          MString.fastRegister,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18
          ),
        ),
      )
    );
  }
  bool _checkInput(){
    if(_supplierController?.text.length==0){
      MessageWidget.show(MString.pleaseInputSupplier);
      return false;
    }
    if(_usernameController?.text.length==0){
      MessageWidget.show(MString.pleaseInputUsername);
      return false;
    }
    if(_passwordController?.text.length==0){
      MessageWidget.show(MString.pleaseInputPassword);
      return false;
    }
    return true;
  }
  _login() async{
    var formData = {
      'username':_usernameController?.text.toString(),
      'password':_passwordController?.text.toString(),
    };
    String supplier = _supplierController?.text.toString()??'';
    var response = await HttpService.post('$supplier/${ApiUrl.login}',param: formData);
    if(response!=null){
      UserModel model = UserModel.fromJson(response['data']);
      MessageWidget.show(MString.loginSuccess);
      await TokenUtil.saveLoginInfo(model);
      var data = {
        'username' :model.username,
        'isLogin':true,
      };
      Call.dispatch(Notify.loginStatus,data:data);
      RouterUtil.pop(context);
    }else{
      MessageWidget.show(MString.loginFail);
      var data = {
        'username':'',
        'isLogin':false
      };
      Call.dispatch(Notify.loginStatus, data: data);
    }
  }

}