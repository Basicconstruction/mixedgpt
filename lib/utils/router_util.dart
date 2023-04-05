//路由处理工具
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixedgpt/page/home/category_specific_ai_page.dart';
import 'package:mixedgpt/page/user/login_page.dart';
import 'package:mixedgpt/page/user/member_page.dart';
import 'package:mixedgpt/page/user/register_page.dart';

class RouterUtil{
  static void toSpecifyPage(BuildContext context,int categoryId) {//不兼容
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>CategorySpecificAiPage(categoryId),
      )
    );
  }

  static void toPromtPage(BuildContext context, String string) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> LoginPage(),
        )
    );
  }
  static void toLoginPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> LoginPage(),
        )
    );
  }
  static void toRegisterPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> RegisterPage(),
        )
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void toMemberPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> MemberPage(),
        )
    );
  }

}

