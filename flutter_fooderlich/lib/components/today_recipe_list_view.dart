import 'package:flutter/material.dart';
import '../models/explore_recipe.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({Key? key, required this.recipes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 5
          Text(
            'Recipes of the Day 🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          // 6
          const SizedBox(height: 16),
          Container(height: 400, color: Colors.grey),
        ],
      ),
    );
  }

  // TODO: Add buildCard() widget here
}
