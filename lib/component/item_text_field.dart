
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget{
  Icon icon;
  TextEditingController? controller;
  FocusNode? focusNode;
  String? title;
  String? hintText;
  bool? obscureText;

  ItemTextField({required this.icon, this.controller, this.focusNode, this.title,
    this.hintText, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),

      ),
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 16,
              top: 8,
              width: 18,
              height: 18,
              child: icon),
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 30,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none
              ),
              style: const TextStyle(fontSize: 14),
              obscureText: obscureText??false,
            ),
          )
        ],
      ),
    );
  }

}