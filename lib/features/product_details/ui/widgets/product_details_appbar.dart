import 'package:care_task/core/theming/styles.dart';
import 'package:care_task/core/widgets/app_snack_bar.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../responsive/responsive_layout.dart';

class ProductDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppbar(
      {super.key, required this.productModel, required this.box});
  final ProductModel productModel;
  final Box box;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, Box box, child) {
        bool isFavorite = box.containsKey(productModel.id);
        return AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          surfaceTintColor: Colors.transparent,
          leading: ResponsiveLayout.isDesktop(context)
              ? null
              : IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Details',
                style: TextStyles.font20WhiteSemiBold,
              ),
              GestureDetector(
                onTap: () => _toggleFavorite(context, box),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _toggleFavorite(BuildContext context, Box box) async {
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
