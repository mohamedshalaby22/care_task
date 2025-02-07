import 'dart:convert';
import 'package:care_task/core/networking/api_constants.dart';
import 'package:care_task/features/products/data/models/product_list_response.dart';
import 'package:http/http.dart' as http;

class ProductsApiService {
  Future<List<ProductListResponse>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('${ApiConstants.baseUrl}/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => ProductListResponse.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
