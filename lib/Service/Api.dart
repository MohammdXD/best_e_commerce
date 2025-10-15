import 'dart:convert';
import 'package:best_e_commerce/Module/Carts_API.dart';
import 'package:http/http.dart' as http;
import 'package:best_e_commerce/Module/Proudect_API.dart';

class Api {
  static String baseUrl = "https://fakestoreapi.com";

  static Future<List<ProudectApi>> getProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => ProudectApi.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  static Future<CartsApi> addProductToCart(
    int id,
    ProudectApi proudect,
    int quantity,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/carts"),
      body: {"productId": id, "quantity": quantity, "product": proudect},
    );

    if (response.statusCode == 200) {
      return CartsApi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add product to cart");
    }
  }
}
