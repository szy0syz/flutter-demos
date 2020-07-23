import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Stack(
        children: <Widget>[
          buildAppBar(),
          buildPagerView(),
        ],
      ),
    );
  }

  Widget buildPagerView() {
    return PageView();
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Icon(Icons.arrow_back_ios, color: Colors.black87),
            Spacer(),
            Image.asset(
              "images/nike.png",
              width: 80,
              color: Colors.black87,
            ),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
