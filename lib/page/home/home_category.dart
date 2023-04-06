import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixedgpt/model/chat/home_category_model.dart';
import 'package:mixedgpt/utils/router_util.dart';

class HomeCategory extends StatelessWidget {
  List<HomeCategoryModel> _list;

  HomeCategory(this._list);

  Widget _categoryItem(BuildContext context, HomeCategoryModel item) {
    return InkWell(
      onTap: () {
        _goCategory(context, item.id ?? 0);
      },
      // child: InkResponse(
      //   radius: 24, // 设置墨水区域半径为 24
      //   splashColor: Colors.red, // 设置水波纹颜色
      //   child: Text('Click me'),
      // ),
      child: Column(
        children: [
          // Image.file(File(item.image??''),
          // Image.network('https://img1.baidu.com/it/u=1557601586,1580328773&fm=253&fmt=auto?w=75&h=100',width: 95,),
          // width: ScreenUtil().setWidth(95),//不兼容

          Text(
            item.name ?? 'null',
            style: const TextStyle(
              fontSize: 18.0,
              // 设置字体大小为 20
              fontWeight: FontWeight.normal,
              // 粗体
              color: Colors.black,
              // 设置字体颜色为黑色
              letterSpacing: 1.2,
              // 字母间距
              height: 1.5,
              // 行高
              fontFamily: 'Arial', // 字体
            ),
          )
          // const Text('hello world',selectionColor: Colors.black,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print('home category build ${_list.length} ${_list[0].name}');
    return Container(
      color: Colors.white54,
      margin: const EdgeInsets.only(top: 5),
      width: 100,
      height: 40,
      // height: ScreenUtil().setHeight(240),// 不兼容的
      padding: const EdgeInsets.all(1.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _list.length,
        padding: const EdgeInsets.all(1.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 0
            // mainAxisSpacing: ScreenUtil().setWidth(10.0),//不兼容的
            // crossAxisSpacing: ScreenUtil().setHeight(10.0),//不兼容的

            ),
        itemBuilder: (BuildContext context, int index) {
          return _categoryItem(context, _list[index]);
        },
      ),
    );
  }

  void _goCategory(BuildContext context, int categoryId) async {
    RouterUtil.toSpecifyPage(context, categoryId);
  }
}
