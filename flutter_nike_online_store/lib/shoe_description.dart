import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:nike_online_store/data.dart';
import 'package:nike_online_store/constants.dart';

class ShoeDescription extends StatefulWidget {
  final Shoe shoe;

  ShoeDescription({@required this.shoe});
  @override
  _ShoeDescriptionState createState() => _ShoeDescriptionState();
}

class _ShoeDescriptionState extends State<ShoeDescription> {
  int _currentIamge = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.shoe.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(
              Icons.arrow_back,
              color: kPurpleCustom.withOpacity(0.5),
              size: 28,
            ),
          ),
        ),
        title: Row(
          children: <Widget>[
            Text(
              "MEN / ",
              style: TextStyle(
                color: kPurpleCustom.withOpacity(0.5),
              ),
            ),
            Text(
              "SHOES",
              style: TextStyle(
                color: kPurpleCustom,
              ),
            )
          ],
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: kPurpleCustom,
            size: 28,
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.shopping_basket,
            color: kPurpleCustom,
            size: 28,
          ),
          SizedBox(
            width: 32,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 32,
            ),
            child: Text(
              widget.shoe.family,
              style: TextStyle(
                  color: kPurpleCustom,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 32,
            ),
            child: Text(
              widget.shoe.name,
              style: TextStyle(
                  color: kPurpleCustom.withOpacity(0.5),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4,
                          bottom: 8,
                        ),
                        child: Text(
                          "STYLE",
                          style: TextStyle(
                            color: kPurpleCustom.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Wolf Grey",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                  size: 28,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4,
                          bottom: 8,
                        ),
                        child: Text(
                          "SIZE",
                          style: TextStyle(
                            color: kPurpleCustom.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "EUR - 45.5",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (int page) {
                      setState(() {
                        _currentIamge = page;
                      });
                    },
                    children: widget.shoe.images.map((path) {
                      return Center(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: size.height * 0.20,
                            margin: EdgeInsets.only(right: 32),
                            child: Hero(
                              tag: widget.shoe.name,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(20 / 360),
                                  child: Image.asset(
                                    path,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
