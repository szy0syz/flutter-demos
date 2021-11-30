import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // 2
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final theme = FooderlichTheme.light();
    final theme = FooderlichTheme.dark();
    // TODO: Apply Home widget
    return MaterialApp(
      // 3
      theme: theme,
      title: 'Fooderlich',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            // 4
            style: theme.textTheme.headline6,
          ),
        ),
        body: Center(
          child: Text(
            'Let\'s get cooking 👩‍🍳',
            // 5
            style: theme.textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
