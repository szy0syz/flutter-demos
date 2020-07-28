import 'package:flutter/material.dart';
import 'package:flutter_nike_app/shoe.dart';
import 'dart:math' as math;
import 'mRec.dart';

class BoxWidget extends StatelessWidget {
  Shoe shoe;
  double pagerValue;
  BoxWidget({
    this.shoe,
    this.pagerValue,
  });

  Tween<double> animation = Tween<double>(begin: .35, end: 1);
  Tween<double> animationRo = Tween<double>(begin: .7, end: 1.5);
  double animationValue = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        buildContainer(size),
        buildBoxDoor(size),
      ],
    );
  }

  Container buildContainer(Size size) {
    return Container(
      child: CustomPaint(
        painter: MRec(),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }

  Widget buildBoxDoor(Size size) {
    return Positioned(
      top: 19,
      left: size.width / 2 - 232 / 2,
      child: Transform(
        origin: Offset(0, 100),
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, .001)
          ..rotateX(math.pi * 0.35),
        child: Center(
          child: Container(
            width: 232,
            height: 200,
            color: Colors.orange[200],
          ),
        ),
      ),
    );
  }
}
