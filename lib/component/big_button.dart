import 'package:flutter/material.dart';
import 'package:mixedgpt/config/color.dart';

class MBigButton extends StatelessWidget{
  String? text;
  Function? onPressed;
  MBigButton({this.text,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      padding: const EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 20,
      height: 48,
      child: MaterialButton(
        onPressed:(){
          if(onPressed!=null){
            onPressed!();
          }
        },
        color: MColor.primaryColor,
        textColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: Text(text??''),
      )
    );
  }

}