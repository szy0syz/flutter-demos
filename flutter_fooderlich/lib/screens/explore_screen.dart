import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot snapshot) {
        // TODO: Add Nested List Views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes ?? [];
          return TodayRecipeListView(recipes: recipes);
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
