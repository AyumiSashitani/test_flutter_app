import 'package:flutter/material.dart';
import 'package:testflutterapp/AnimatedContainerSample.dart';

main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

class PageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        RaisedButton(
          child: Text("テスト"),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
        RaisedButton(
          child: Text("テスト2"),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
      ]),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        AnimatedContainerSample(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
