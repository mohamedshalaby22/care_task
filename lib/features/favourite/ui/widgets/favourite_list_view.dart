import 'package:care_task/core/routing/routes.dart';
import 'package:care_task/core/theming/styles.dart';
import 'package:care_task/core/widgets/app_snack_bar.dart';
import 'package:care_task/features/products/ui/product_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/product_model.dart';

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ProductModel>('favourite');
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, box, child) {
        if (box.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                "No favorites yet!",
                style: TextStyles.font16BlackMedium,
              ),
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              ProductModel product = box.getAt(index) as ProductModel;
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.productDetailsScreen,
                      arguments: product);
                },
                child: ProductCard(
                  image: product.image,
                  title: product.title,
                  price: product.price,
                  isFavourite: true,
                  onPress: () {
                    _removeFavorite(context, box, product.id);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _removeFavorite(
    context,
    Box box,
    int productId,
  ) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    await box.delete(productId);
    if (context.mounted) {
      AppSnackBar.showSnackBarWidget(
        context: context,
        message: 'Product removed from favourite Successfully!',
        backColor: Colors.red[300]!,
      );
    }
  }
}
