import 'package:care_task/core/routing/routes.dart';
import 'package:care_task/core/widgets/app_snack_bar.dart';
import 'package:care_task/features/products/data/models/product_list_response.dart';
import 'package:care_task/features/products/ui/product_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../favourite/data/models/product_model.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.products});
  final List<ProductListResponse> products;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<ProductModel>('favourite').listenable(), 
      builder: (context, box, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final isFavorite = box.containsKey(product.id);
              return GestureDetector(
                onTap: () => _navigateToProductDetails(context, product),
                child: ProductCard(
                  image: product.image,
                  title: product.title,
                  price: product.price.toString(),
                  isFavourite: isFavorite,
                  onPress: () => _toggleFavorite(context, box, product),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _navigateToProductDetails(
      BuildContext context, ProductListResponse product) {
    final productModel = _convertToProductModel(product);
    Navigator.pushNamed(context, Routes.productDetailsScreen,
        arguments: productModel);
  }

  ProductModel _convertToProductModel(ProductListResponse product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      price: product.price.toString(),
      image: product.image,
    );
  }

  Future<void> _toggleFavorite(BuildContext context, Box<ProductModel> box,
      ProductListResponse product) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final productModel = _convertToProductModel(product);

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
