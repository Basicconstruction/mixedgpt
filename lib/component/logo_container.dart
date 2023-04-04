
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixedgpt/config/color.dart';

class LogoContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double height = 200.0;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: MColor.primaryColor,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: (width-90)/2.0,
            top: height-45,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Theme.of(context).cardColor,blurRadius: 4.0)
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/head.jpeg')
                )
              ),
            )
          ),
        ],
      ),
    );
  }

}