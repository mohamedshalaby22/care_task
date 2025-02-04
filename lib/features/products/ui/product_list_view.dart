import 'package:care_task/core/routing/routes.dart';
import 'package:care_task/core/widgets/app_snack_bar.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';
import 'package:care_task/features/products/ui/product_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('favourite').listenable(),
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
                  price: product.price,
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

  void _navigateToProductDetails(BuildContext context, ProductModel product) {
    Navigator.pushNamed(context, Routes.productDetailsScreen,
        arguments: product);
  }

  Future<void> _toggleFavorite(
      BuildContext context, Box box, ProductModel product) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

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
      await box.put(product.id, product);
      if (context.mounted) {
        AppSnackBar.showSnackBarWidget(
          context: context,
          message: 'Product added to favourite!',
        );
      }
    }
  }
}
