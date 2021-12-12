import 'models/models.dart';

abstract class Repository {
  // Add find methods
  List<Recipe> findAllRecipes();
  Recipe findRecipeById(int id);
  List<Ingredient> findAllIngredients();
  List<Ingredient> findRecipeIngredients(int recipeId);

  // Add insert methods

  // Add delete methods

  // Add initializing and closing methods
}
