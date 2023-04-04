import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MMediumButton extends StatelessWidget{
  String? text;
  Color? color;
  Function? onPressed;
  MMediumButton({this.text,this.onPressed,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(700),
      child: MaterialButton(
        onPressed:() async{
          if(onPressed!=null){
            onPressed!();
          }
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        color: color,
        child: Text(
          text??'',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(28)
          ),
        )
      )
    );
  }

}