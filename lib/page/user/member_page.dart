import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mixedgpt/call/call.dart';
import 'package:mixedgpt/call/notify.dart';
import 'package:mixedgpt/config/index.dart';
import 'package:mixedgpt/utils/router_util.dart';
import 'package:mixedgpt/utils/token_util.dart';

class MemberPage extends StatefulWidget {
  @override
  MemberPageState createState() {
    return MemberPageState();
  }
}

class MemberPageState extends State<MemberPage> {
  bool _isLogin = false;
  String _username = '';

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.loginStatus, _loginCallBack);
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          height: 220.0,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/head_bg.png"),
                fit: BoxFit.cover),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipOval(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/images/head.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              _isLogin
                  ? Expanded(
                      flex: 1,
                      child: Text(
                        _username,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    )
                  : Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          RouterUtil.toLoginPage(context);
                        },
                        child: const Text(MString.loginOrRegister,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
            ],
          ),
        ),
        const ListTile()
      ],
    ));
  }

  _loginCallBack(data) {
    if (data['isLogin']) {
      setState(() {
        _username = data['username'];
        _isLogin = true;
      });
    } else {
      _username = '';
      _isLogin = false;
    }
  }

  void _checkLogin() async {
    bool login = await TokenUtil.isLogin();
    var user = await TokenUtil.getUserInfo();
    setState(() {
      _isLogin = login;
      _username = user['username'];
    });
  }
}
