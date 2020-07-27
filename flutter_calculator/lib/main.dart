import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/CalcButton.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 24),
                  color: Color(0xff545f61),
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 48),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor: 0xFF6C807F,
                  textSize: 20,
                  callback: numClick,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: 0xFF6C807F,
                  callback: numClick,
                ),
                CalcButton(
                  text: '%',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  callback: numClick,
                ),
                CalcButton(
                  text: '8',
                  callback: numClick,
                ),
                CalcButton(
                  text: '9',
                  callback: numClick,
                ),
                CalcButton(
                  text: '*',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 24,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  callback: numClick,
                ),
                CalcButton(
                  text: '5',
                  callback: numClick,
                ),
                CalcButton(
                  text: '6',
                  callback: numClick,
                ),
                CalcButton(
                  text: '-',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 38,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  callback: numClick,
                ),
                CalcButton(
                  text: '2',
                  callback: numClick,
                ),
                CalcButton(
                  text: '3',
                  callback: numClick,
                ),
                CalcButton(
                  text: '+',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  callback: numClick,
                ),
                CalcButton(
                  text: '0',
                  callback: numClick,
                ),
                CalcButton(
                  text: '00',
                  callback: numClick,
                  textSize: 26,
                ),
                CalcButton(
                  text: '=',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
