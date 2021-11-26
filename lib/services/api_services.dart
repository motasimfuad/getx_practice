import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  String stringResponse = '';
  List listResponse = [];

  Future fetchProducts() async {
    final stringUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(stringUrl);
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

  Future fetchSingleProduct(int id) async {
    final singleProductUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final resSingleProduct = await http.get(singleProductUrl);
    print(resSingleProduct.body);
    return json.decode(resSingleProduct.body);
  }

  Future fetchCategories() async {
    final categoriesUrl =
        Uri.parse('https://fakestoreapi.com/products/categories');
    final resCategories = await http.get(categoriesUrl);
    return json.decode(resCategories.body);
  }

  // post login
  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final loginRes = await http.post(
      loginUrl,
      body: {
        "username": username,
        "password": password,
      },
    );
    print(loginRes.body);
    return json.decode(loginRes.body);
  }
}
