import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixedgpt/config/color.dart';
import 'package:mixedgpt/config/string.dart';
import 'package:mixedgpt/model/promt_model.dart';
import 'package:mixedgpt/utils/color_util.dart';
import 'package:mixedgpt/utils/router_util.dart';

class Promt extends StatefulWidget{
  List<PromtModel> _promt = [];
  Promt(this._promt);

  @override
  PromtState createState() {
    return PromtState();
  }

}

class PromtState extends State<Promt>{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(widget._promt.isEmpty){
      return Container();
    }
    return Container(
      width: width,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 7.5),
      child: _promtList(context,width,widget._promt),
    );
  }
  Widget _promtList(BuildContext context,double deviceWidth,List<PromtModel> promtList){
    double itemWidth = deviceWidth*168.5/300;
    List<Widget> listWidgets = promtList.map((item){
      var bgColor = ColorUtil.string2Color('#f8f8f8');
      return InkWell(
        onTap: (){
          RouterUtil.toPromtPage(context,item.id.toString());
        },
        child: Container(
          width: itemWidth,
          margin: const EdgeInsets.only(bottom: 5,left: 2),
          padding: const EdgeInsets.only(top: 10,left: 13,bottom: 7),
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.name.length>8?item.name.substring(0,8):item.name,
                maxLines: 1,
                style: const TextStyle(fontSize: 15,color: Colors.green),
              ),
              Text(
                item.name??'',
                maxLines: 1,
                style: TextStyle(fontSize: 15,color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
          alignment: Alignment.center,
          child: const Text(
            MString.promtList,
            style: TextStyle(color: MColor.homeSubTtleColor),
          ),
        ),
        Wrap(
          spacing: 2,
          children: listWidgets,
        )
      ],
    );
  }

}
