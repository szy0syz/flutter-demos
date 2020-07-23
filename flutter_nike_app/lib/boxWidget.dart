import 'package:flutter/material.dart';

import 'mRec.dart';

class BoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
}
