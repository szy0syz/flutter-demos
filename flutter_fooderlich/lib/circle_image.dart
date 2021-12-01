import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  // 1
  final double imageRadius;
  final ImageProvider? imageProvider;

  // 2
  const CircleImage({Key? key, this.imageRadius = 20, this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      // 4
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
