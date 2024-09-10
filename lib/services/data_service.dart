import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  final HttpService _httpService = HttpService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

//From getProducts() - get product list
  Future<List<Product>?> getProducts() async {
    String path = 'products/';

    // if (filter.isNotEmpty) {
    //   path += "category/$filter";
    // }

    var response = await _httpService.get(path);

    if (response?.statusCode == 200 && response?.data != null) {
      print(response?.data);
      // Assuming the response data is a list of products
      // Product product = Product.fromJson(response!.data);
      // return product;
    }

    // Handle errors or unexpected cases
    throw Exception('Failed to load products');
  }

  Future<Product> getProductById(String productId) async {
    String path = 'products/$productId';

    var response = await _httpService.get(path);

    if (response?.statusCode == 200 && response?.data != null) {
      // Parse single product
      Product product = Product.fromJson(response!.data);
      return product;
    }

    // Handle errors or unexpected cases
    throw Exception('Failed to load product');
  }

  // Future<Recipe> getRecipes(String filter) async {
  //   String path = 'recipes/';

  //   if (filter.isNotEmpty) {
  //     path += "meal-type/$filter";
  //   }
  //   var response = await _httpService.get(path);
  //   if (response?.statusCode == 200 && response?.data != null) {
  //     Recipe recipe = Recipe.fromJson(response!.data);
  //     return recipe;
  //   }
  //   // Handle errors or unexpected cases
  //   return Recipe(
  //     recipes: [],
  //     total: 0,
  //     skip: 0,
  //     limit: 0,
  //   );
  // }
}
