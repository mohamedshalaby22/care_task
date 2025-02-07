import 'package:get_it/get_it.dart';
import '../../features/products/data/apis/products_api_service.dart';
import '../../features/products/data/repo/products_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ProductsApiService>(() => ProductsApiService());
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
}
