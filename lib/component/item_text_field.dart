import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// outdated
class ItemTextField extends StatelessWidget {
  Icon icon;
  TextEditingController? controller;
  FocusNode? focusNode;
  String? title;
  String? hintText;
  bool? obscureText;

  ItemTextField(
      {required this.icon,
      this.controller,
      this.focusNode,
      this.title,
      this.hintText,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    obscureText ??= false;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(left: 16, top: 8, width: 18, height: 18, child: icon),
          Positioned(
              left: 55,
              right: 10,
              top: 8,
              height: 40,
              child: SizedBox(
                height: 40,
                child: obscureText! ? generateSecure() : generateNotSercure(),
              ))
        ],
      ),
    );
  }

  Widget generateNotSercure() {
    return TextField(
      maxLines: null,
      minLines: null,
      textAlignVertical: TextAlignVertical.center,
      expands: true,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
      style: const TextStyle(fontSize: 24),
      obscureText: false,
    );
  }

  Widget generateSecure() {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
      style: const TextStyle(fontSize: 24),
      obscureText: true,
    );
  }
}
