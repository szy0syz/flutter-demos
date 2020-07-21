import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.home,
                size: 32,
                color: Colors.grey[500],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Menu Option",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
