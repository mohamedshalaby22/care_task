import 'package:care_task/features/product_details/ui/widgets/product_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/product_details_cubit.dart';

class ProductDetailsBlocBuilder extends StatelessWidget {
  const ProductDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        }, success: (productDetailsResponse) {
          return setupSuccess(productDetailsResponse);
        }, error: (errorHandler) {
          return const SizedBox.shrink();
        }, orElse: () {
          return const SizedBox.shrink();
        });
      },
    );
  }

  Widget setupSuccess(product) {
    return ProductDetailsSection(
      productDetails: product,
    );
  }
}
