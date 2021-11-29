import 'package:flutter_t1/model/ingredients_model.dart';

class Recipe {
  String lable;
  String imgUrl;
  int servings;
  List<Ingredient> ingredients;

  Recipe(this.lable, this.imgUrl, this.servings, this.ingredients);

  static List<Recipe> samples = [
    Recipe('title - 1', 'images/pic.jpeg', 4, [
      Ingredient(
        1,
        'box',
        'Spaghetti',
      ),
      Ingredient(
        4,
        '',
        'Frozen Meatballs',
      ),
      Ingredient(
        0.5,
        'jar',
        'sauce',
      )
    ]),
    Recipe('title - 2', 'images/pic.jpeg', 4, [
      Ingredient(
        1,
        'box',
        'Spaghetti',
      ),
      Ingredient(
        4,
        '',
        'Frozen Meatballs',
      ),
      Ingredient(
        0.5,
        'jar',
        'sauce',
      )
    ]),
    Recipe('title - 3', 'images/pic.jpeg', 4, [
      Ingredient(
        1,
        'box',
        'Spaghetti',
      ),
      Ingredient(
        4,
        '',
        'Frozen Meatballs',
      ),
      Ingredient(
        0.5,
        'jar',
        'sauce',
      )
    ]),
    Recipe('title - 4', 'images/pic.jpeg', 4, [
      Ingredient(
        1,
        'box',
        'Spaghetti',
      ),
      Ingredient(
        4,
        '',
        'Frozen Meatballs',
      ),
      Ingredient(
        0.5,
        'jar',
        'sauce',
      )
    ]),
    Recipe('title - 5', 'images/pic.jpeg', 4, [
      Ingredient(
        1,
        'box',
        'Spaghetti',
      ),
      Ingredient(
        4,
        '',
        'Frozen Meatballs',
      ),
      Ingredient(
        0.5,
        'jar',
        'sauce',
      )
    ]),
  ];
}
