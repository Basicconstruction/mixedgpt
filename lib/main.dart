import 'package:flutter/material.dart';
import 'package:mixedgpt/config/color.dart';
import 'package:mixedgpt/config/string.dart';
import 'package:mixedgpt/page/main_page.dart';

void main() {
  runApp(MyApp());
}
// flutter 2.19.6
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //标题
      title: MString.mainTitle,
      debugShowCheckedModeBanner: false,
      // 定制主题
      theme: ThemeData(
        primaryColor: MColor.primaryColor,
      ),
      home: MainPage(),
    );
  }
}

