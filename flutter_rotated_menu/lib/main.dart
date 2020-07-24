import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Color lightColor = Color(0xff423f52);
Color darkColor = Color(0xff39364a);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkColor,
      body: Stack(
        children: <Widget>[
          buildBody(),
          buildMenu(size),
        ],
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Image.asset('images/content_1.png'),
        Image.asset('images/content_2.png'),
      ],
    );
  }

  Widget buildMenu(Size size) {
    return Container(
      color: lightColor,
      width: size.width,
      height: size.height,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Icon(Icons.menu, color: Colors.white, size: 30),
          SizedBox(height: 40),
          buildItem('images/ic_profile.png', "PROFILE"),
          SizedBox(
            height: 20,
          ),
          buildItem('images/ic_feed.png', "FEED"),
          SizedBox(
            height: 20,
          ),
          buildItem('images/ic_activity.png', "ACTIVITY", isSelected: true),
          SizedBox(
            height: 100,
          ),
          buildItem('images/ic_settings.png', "SETTINGS"),
        ],
      ),
    );
  }

  Widget buildItem(String image, String text, {bool isSelected = false}) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 100,
        ),
        Image.asset(
          image,
          width: 30,
          height: 30,
          color: isSelected ? Colors.cyanAccent : Colors.white,
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: 'IntroRust',
              color: isSelected ? Colors.cyanAccent : Colors.white,
              fontSize: 25),
        )
      ],
    );
  }
}
