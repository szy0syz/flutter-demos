import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceeNumber = 1;
  int rightDiceeNumber = 1;

  void changeDiceFace() {
    leftDiceeNumber = Random().nextInt(6) + 1;
    rightDiceeNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  changeDiceFace();
                });
              },
              child: Image.asset('images/dice$leftDiceeNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  changeDiceFace();
                });
              },
              child: Image.asset('images/dice$rightDiceeNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// class DicePage extends StatelessWidget {
//   var leftDiceeNumber = 5;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: FlatButton(
//               onPressed: () {},
//               child: Image.asset('images/dice$leftDiceeNumber.png'),
//             ),
//           ),
//           Expanded(
//             child: FlatButton(
//               onPressed: () {},
//               child: Image.asset('images/dice1.png'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
