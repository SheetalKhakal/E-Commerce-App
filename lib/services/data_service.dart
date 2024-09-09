import 'package:e_commerce_app/models/recipe.dart';
import 'package:e_commerce_app/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  final HttpService _httpService = HttpService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

//From getRecipes() - get recipe list
  Future<Recipe> getRecipes(String filter) async {
    String path = 'recipes/';

    if (filter.isNotEmpty) {
      path += "meal-type/$filter";
    }
    var response = await _httpService.get(path);
    if (response?.statusCode == 200 && response?.data != null) {
      Recipe recipe = Recipe.fromJson(response!.data);
      return recipe;
    }
    // Handle errors or unexpected cases
    return Recipe(
      recipes: [],
      total: 0,
      skip: 0,
      limit: 0,
    );
  }
}
