import 'package:care_task/features/products/data/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/product_list_response.dart';
part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(const ProductsState.initial());
  Future<void> fetchProducts() async {
    emit(const ProductsState.loading());

    try {
      final products = await productsRepo.getProducts();
      emit(ProductsState.success(products));
    } catch (e) {
      emit(ProductsState.error(message: e.toString()));
    }
  }
}
