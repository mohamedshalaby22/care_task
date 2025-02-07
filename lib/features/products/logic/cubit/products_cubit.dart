import 'package:care_task/features/products/data/repo/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../favourite/data/models/product_model.dart';
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

  ProductModel convertToProductModel(ProductListResponse product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      price: product.price.toString(),
      image: product.image,
    );
  }

  Future<void> toggleFavorite(BuildContext context, Box<ProductModel> box,
      ProductListResponse product) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final productModel = convertToProductModel(product);
    if (box.containsKey(product.id)) {
      await box.delete(product.id);
      if (context.mounted) {
        AppSnackBar.showSnackBarWidget(
          context: context,
          message: 'Product removed from favourite!',
          backColor: Colors.red[300]!,
        );
      }
    } else {
      await box.put(product.id, productModel);
      if (context.mounted) {
        AppSnackBar.showSnackBarWidget(
          context: context,
          message: 'Product added to favourite!',
        );
      }
    }
  }
}
