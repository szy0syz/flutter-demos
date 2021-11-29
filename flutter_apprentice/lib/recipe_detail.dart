import 'package:flutter/material.dart';
import 'package:flutter_apprentice/model/recipe_model.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.lable)),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.recipe.imgUrl),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.recipe.lable,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                      "${ingredient.quantity} ${ingredient.measure} ${ingredient.name}");
                }),
          ),
          Slider(
              min: 1,
              max: 10,
              divisions: 10,
              activeColor: Colors.green,
              inactiveColor: Colors.black,
              label: "${_sliderVal * widget.recipe.servings} servings",
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              }),
        ],
      )),
    );
  }
}
