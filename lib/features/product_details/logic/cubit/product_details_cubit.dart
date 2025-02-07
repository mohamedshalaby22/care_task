import 'package:care_task/features/product_details/data/repo/product_details_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../favourite/data/models/product_model.dart';
import '../../data/models/product_details_response.dart';
part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo productDetailsRepo;
  final int productId;
  ProductDetailsCubit(this.productDetailsRepo, this.productId)
      : super(const ProductDetailsState.initial());
  Future<void> fetchProductDetails() async {
    emit(const ProductDetailsState.loading());

    try {
      final productDetails =
          await productDetailsRepo.getProductDetails(id: productId);
      emit(ProductDetailsState.success(productDetails));
    } catch (e) {
      emit(ProductDetailsState.error(message: e.toString()));
    }
  }

  

  Future<void> toggleFavorite(BuildContext context, Box<ProductModel> box,
      ProductModel productModel) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (box.containsKey(productModel.id)) {
      await box.delete(productModel.id);
      if (context.mounted) {
        AppSnackBar.showSnackBarWidget(
          context: context,
          message: 'Product removed from favourite!',
          backColor: Colors.red[300]!,
        );
      }
    } else {
      await box.put(productModel.id, productModel);
      if (context.mounted) {
        AppSnackBar.showSnackBarWidget(
          context: context,
          message: 'Product added to favourite!',
        );
      }
    }
  }
}
