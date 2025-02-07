import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_task/core/helpers/spacing.dart';
import 'package:care_task/core/theming/styles.dart';
import 'package:care_task/features/product_details/data/models/product_details_response.dart';
import 'package:flutter/material.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key, required this.productDetails});
  final ProductDetailsResponse productDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductImage(
          context: context,
          image: productDetails.image,
        ),
        verticalSpacing(15),
        _buildTitleAndDes(
          title: productDetails.title,
          description: productDetails.description,
        ),
        _buildCategory(category: productDetails.category, context: context),
        verticalSpacing(15),
        _buildPrice(
            price: '\$${productDetails.price.toString()}', context: context),
      ],
    );
  }

  Row _buildCategory(
      {required String category, required BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category:',
          style: TextStyles.font14GreyMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            category,
            style: TextStyles.font16BlackMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndDes(
      {required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font16BlackMedium,
        ),
        verticalSpacing(10),
        Text(
          description,
          style: TextStyles.font14GreyMedium,
        ),
        verticalSpacing(15),
      ],
    );
  }

  Center _buildProductImage(
      {required String image, required BuildContext context}) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: image,
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Row _buildPrice({required String price, required BuildContext context}) {
    return Row(
      children: [
        Text(
          'Price:',
          style: TextStyles.font14GreyMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            price,
            style: TextStyles.font16BlackMedium,
          ),
        ),
      ],
    );
  }
}
