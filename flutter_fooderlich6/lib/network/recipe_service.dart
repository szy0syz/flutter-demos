import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';

const String apiKey = 'c9e835e0d151c03b9535e1dbdd93d1b6';
const String apiId = '930ee8e3';
const String apiUrl = 'https://api.edamam.com/search';

@ChopperApi()
abstract class RecipeService extends ChopperService {
  @Get(path: 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      @Query('q') String query,
      @Query('from') int from,
      @Query('to') int to);
  // TODO: Add create()
}
// TODO: Add _addQuery()

// class RecipeService {
//   Future<dynamic> getRecipes(String query, int from, int to) async {
//     final recipeData = await getData(
//         '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
//     return recipeData;
//   }

//   Future getData(String url) async {
//     print('Calling uri: $url');
//     final response = await get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
