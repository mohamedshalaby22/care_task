
import 'package:care_task/features/product_details/data/models/product_details_response.dart';
import '../apis/product_details_api_service.dart';

class ProductDetailsRepo {
  final ProductDetailsApiService productDetailsApiService;
  ProductDetailsRepo(this.productDetailsApiService);
  Future<ProductDetailsResponse> getProductDetails({required int id}) async {
    return await productDetailsApiService.fetchProductDetails(id);
  }
}
