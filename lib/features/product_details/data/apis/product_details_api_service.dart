import 'dart:convert';
import 'package:care_task/core/networking/api_constants.dart';
import 'package:care_task/features/product_details/data/models/product_details_response.dart';
import 'package:http/http.dart' as http;

class ProductDetailsApiService {
  Future<ProductDetailsResponse> fetchProductDetails(int id) async {
    final response =
        await http.get(Uri.parse('${ApiConstants.baseUrl}/products/$id'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ProductDetailsResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
