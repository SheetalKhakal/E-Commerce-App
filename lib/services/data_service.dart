import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  final HttpService _httpService = HttpService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

// From getProducts() - get product list

  Future<List<Product>?> getProducts(
      {String filter = '', String sort = ''}) async {
    String path = 'products/';

    if (filter.isNotEmpty) {
      path += "category/$filter";
    }

    // Append sorting if provided
    if (sort.isNotEmpty) {
      // Assuming the sort parameter is something like 'asc' or 'desc'
      // Example: 'asc' for ascending, 'desc' for descending
      path += (path.contains('?') ? '&' : '?') + 'sort=$sort';
    }

    var response = await _httpService.get(path);

    if (response?.statusCode == 200 && response?.data != null) {
      print(response?.data);
      // Assuming the response is a list of product JSON objects
      List<dynamic> productListJson = response!.data as List<dynamic>;

      // Convert each JSON object into a Product instance
      List<Product> productList =
          productListJson.map((json) => Product.fromJson(json)).toList();

      return productList;
    }

    // Handle errors or unexpected cases
    throw Exception('Failed to load products');
  }

  // Future<List<Product>?> getProducts(String filter) async {
  //   String path = 'products/';

  //   if (filter.isNotEmpty) {
  //     path += "category/$filter";
  //   }

  //   var response = await _httpService.get(path);

  //   if (response?.statusCode == 200 && response?.data != null) {
  //     print(response?.data);
  //     // Assuming the response is a list of product JSON objects
  //     List<dynamic> productListJson = response!.data as List<dynamic>;

  //     // Convert each JSON object into a Product instance
  //     List<Product> productList =
  //         productListJson.map((json) => Product.fromJson(json)).toList();

  //     return productList;
  //   }

  //   // Handle errors or unexpected cases
  //   throw Exception('Failed to load products');
  // }

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
}
