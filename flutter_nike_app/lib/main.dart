import 'package:flutter/material.dart';
import 'package:flutter_nike_app/boxWidget.dart';
import 'package:flutter_nike_app/shoe.dart';

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
  double pagerValue = 0;
  PageController pageController;

  @override
  void initState() {
    setState(() {
      pagerValue = pageController.page;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Stack(
        children: <Widget>[
          buildAppBar(),
          buildPagerView(),
        ],
      ),
    );
  }

  Widget buildPagerView() {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: PageView(
        controller: pageController,
        children: getShoes()
            .map((e) => BoxWidget(
                  shoe: e,
                  pagerValue: pagerValue,
                ))
            .toList(),
      ),
    );
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

  List<Shoe> getShoes() {
    List<Shoe> list = [];
    list.add(Shoe(0, 'images/image1.png', 'FALCONE SHOES', 'PINK', 110, 4.3));
    list.add(Shoe(1, 'images/image2.png', 'Air Max 270', 'BLACK', 110, 4.3));
    list.add(Shoe(2, 'images/image3.png', 'Air Max 270', 'WHITE', 110, 4.3));
    return list;
  }
}
