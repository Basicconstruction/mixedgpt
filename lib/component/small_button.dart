import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixedgpt/config/color.dart';

class MSmallButton extends StatelessWidget{
  String? text;
  Function? onPressed;
  MSmallButton({this.text,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      height: 42,
      child: InkWell(
        onTap:(){
          if(onPressed!=null){
            onPressed!();
          }
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            text??'',
            style: const TextStyle(
              color: Colors.white
            )
          ),
        )
      )
    );
  }

}