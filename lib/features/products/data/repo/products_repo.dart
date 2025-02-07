import 'package:care_task/features/products/data/apis/products_api_service.dart';
import 'package:care_task/features/products/data/models/product_list_response.dart';

class ProductsRepo {
  final ProductsApiService productsApiService;
  ProductsRepo(this.productsApiService);
  Future<List<ProductListResponse>> getProducts() async {
    return await productsApiService.fetchProducts();
  }
}
