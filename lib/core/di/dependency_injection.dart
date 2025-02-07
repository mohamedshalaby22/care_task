import 'package:get_it/get_it.dart';
import '../../features/product_details/data/apis/product_details_api_service.dart';
import '../../features/product_details/data/repo/product_details_repo.dart';
import '../../features/products/data/apis/products_api_service.dart';
import '../../features/products/data/repo/products_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // home products
  getIt.registerLazySingleton<ProductsApiService>(() => ProductsApiService());
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));

  // productDetails
  getIt.registerLazySingleton<ProductDetailsApiService>(
      () => ProductDetailsApiService());
  getIt.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(getIt()));
}
