import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  @override
  SupplierPageState createState() {
    return SupplierPageState();
  }
}

class SupplierPageState extends State<SupplierPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey],
        ),
        boxShadow: [BoxShadow(blurRadius: 10)],
      ),
      alignment: Alignment.center,
      foregroundDecoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5), shape: BoxShape.circle),
      child: Container(
        color: Colors.white,
        width: 50,
        height: 50,
      ),
    ); // return const Placeholder(
    //   strokeWidth: 12,
    //   color: Colors.blue,
    // );
    // return Container(
    //     color: Colors.pink,
    //     margin: const EdgeInsets.all(16),
    //     alignment: Alignment.center,
    //     child: Container(
    //       width: 200,
    //       height: 100,
    //       color: Colors.grey,
    //       alignment: Alignment.topLeft,
    //       child: Container(
    //         width: 120,
    //         height: 80,
    //         color: Colors.black,
    //         alignment: Alignment.bottomCenter,
    //         child: Container(
    //           width: 20,
    //           height: 40,
    //           color: Colors.white,
    //         ),
    //       ),
    //     ));
  }
}
