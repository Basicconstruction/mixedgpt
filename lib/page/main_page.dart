
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixedgpt/config/string.dart';
import 'package:mixedgpt/page/home/home_page.dart';
import 'package:mixedgpt/page/market/market_page.dart';
import 'package:mixedgpt/page/supplier/supplier_page.dart';
import 'package:mixedgpt/page/user/member_page.dart';

class MainPage extends StatefulWidget{
  @override
  MainPageState createState() {
    return MainPageState();
  }

}

class MainPageState extends State<MainPage>{
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _tabs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: MString.homeTitle
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: MString.supplier,
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shop),
        label: MString.market,
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: MString.personalCenter,
    ),
  ];
  @override
  Scaffold build(BuildContext context){
    //final ScreenUtil = await FlutterScreenUtil.create();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _tabs,
        onTap:(index){
          setState(() {
            _currentIndex = index;
          });
        }
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          SupplierPage(),
          MarketPage(),
          MemberPage()
        ],
      )
    );

  }
}