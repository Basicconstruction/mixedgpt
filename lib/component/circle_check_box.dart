import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixedgpt/config/color.dart';

class CircleCheckBox extends StatefulWidget{
  bool? value = false;
  Function? onChanged;
  CircleCheckBox({this.value,this.onChanged});
  @override
  CircleCheckBoxState createState() {
    return CircleCheckBoxState();
  }

}

class CircleCheckBoxState extends State<CircleCheckBox>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap:(){
          widget.value = !(widget.value??false);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (widget.value??false)?Icon(Icons.check_circle,size: 28.0,color: MColor.checkBoxColor):const Icon(
            Icons.panorama_fish_eye,
            size: 28.0,
              color: Colors.grey,
          )
        ),
      )
    );
  }
}