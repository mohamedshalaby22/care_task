import 'package:care_task/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:care_task/core/theming/styles.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';

class ProductDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppbar({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<ProductModel>('favourite').listenable(),
      builder: (context, box, child) {
        bool isFavorite = box.containsKey(productModel.id);
        return AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Product Details', style: TextStyles.font2BlackSemiBold),
              GestureDetector(
                onTap: () => context
                    .read<ProductDetailsCubit>()
                    .toggleFavorite(context, box,productModel),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
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
}
