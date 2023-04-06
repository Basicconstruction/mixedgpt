import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mixedgpt/config/string.dart';
import 'package:mixedgpt/model/chat/home_category_model.dart';
import 'package:mixedgpt/model/chat/prompt_model.dart';
import 'package:mixedgpt/page/home/home_category.dart';
import 'package:mixedgpt/page/home/prompt.dart';
import 'package:mixedgpt/utils/share_util.dart';

class HomePage extends StatefulWidget {
  // HomeContentModel _homeModel;

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('首页刷新了');
    _initData();
  }

  List<HomeCategoryModel> homeCms = [];
  List<PromptModel> promptms = [];

  _initData() async {
    setState(() {
      homeCms.addAll([
        HomeCategoryModel(id: 1, name: MString.aiChat),
        HomeCategoryModel(id: 2, name: MString.aiAnswer)
      ]);
      // String? promts = await ShareUtil.getFromSharePreference("promtms");
      // List<String> json = promts?.split('\n')??[];
      // json.forEach((element) {
      //   Map<String,dynamic> maps = jsonDecode(element);
      //   promtms.add(PromtModel(maps['id'], maps['name'], maps['description']));
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: const Text(MString.homeTitle),
      ),
      body: homeCms.isEmpty
          ? Container()
          : ListView(
              children: <Widget>[HomeCategory(homeCms), Prompt(promptms)],
            ),
    );
  }
}
