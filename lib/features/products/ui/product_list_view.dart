import 'package:care_task/core/routing/routes.dart';
import 'package:care_task/features/products/data/models/product_list_response.dart';
import 'package:care_task/features/products/ui/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../favourite/data/models/product_model.dart';
import '../logic/cubit/products_cubit.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.products});
  final List<ProductListResponse> products;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<ProductModel>('favourite').listenable(),
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
                  onPress: () => context
                      .read<ProductsCubit>()
                      .toggleFavorite(context, box, product),
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
    final productModel =
        context.read<ProductsCubit>().convertToProductModel(product);
    Navigator.pushNamed(context, Routes.productDetailsScreen,
        arguments: productModel);
  }
}
