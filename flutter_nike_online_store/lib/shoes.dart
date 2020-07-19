import 'package:flutter/material.dart';
import 'data.dart';
import 'constants.dart';

class Shoes extends StatefulWidget {
  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  List<Filter> filters = getFilterList();
  Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(
            Icons.arrow_back,
            color: kPurpleCustom.withOpacity(0.5),
            size: 28,
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
            padding: EdgeInsets.only(left: 32),
            child: Text(
              "Men Shoes",
              style: TextStyle(
                color: kPurpleCustom,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 48,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal, // 水平滚动
              children: buildFilters(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildFilters() {
    List<Widget> list = [];

    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilterOption(filters[i], i));
    }

    return list;
  }

  Widget buildFilterOption(Filter filter, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 24, left: index == 0 ? 32 : 0),
        child: Text(
          filter.name,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selectedFilter == filter
                  ? kPurpleCustom
                  : kPurpleCustom.withOpacity(0.5)),
        ),
      ),
    );
  }
}
