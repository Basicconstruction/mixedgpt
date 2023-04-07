import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  @override
  MarketPageState createState() {
    return MarketPageState();
  }
}

class MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        children: <Widget>[
          Text(
            '文字镂空效果',
            style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4
                  ..color = Colors.black
            ),
          ),
          const Text(
            '文字镂空效果',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          )

        ],
      ),
    );
    // return Container(
    //   width: 100,
    //   height: 100,
    //   color: Colors.grey[200],
    //   child: const Align(
    //     alignment: Alignment(2.0, 0),
    //     // alignment: FractionalOffset(2, 0.5),
    //     child: FlutterLogo(
    //       size: 50,
    //     ),
    //   ),
    // );
    // return Container(
    //   width: double.infinity,
    //   height: 400,
    //   alignment: Alignment.center,
    //   child: const SizedBox(width: 200, height: 200, child: FlutterLogo()),
    // );
    // return Container(
    //   width: 200,
    //   height: 200,
    //   color: Colors.grey[200],
    //   child: Stack(
    //     children: const [
    //       Positioned(
    //         left: 20,
    //         top: 20,
    //         width: 50,
    //         height: 50,
    //         child: FlutterLogo(),
    //       ),
    //       Positioned(
    //         left: 20,
    //         bottom: 20,
    //         child: FlutterLogo(),
    //       ),
    //       Positioned(
    //         right: 20,
    //         top: 20,
    //         child: FlutterLogo(),
    //       ),
    //       Positioned(
    //         left: 100,
    //         top: 100,
    //         right: 20,
    //         bottom: 20,
    //         child: FlutterLogo(),
    //       )
    //     ],
    //   ),
    // );
    // return const Placeholder(
    //   strokeWidth: 10,
    //   color: Colors.amber,
    // );
  }
}
