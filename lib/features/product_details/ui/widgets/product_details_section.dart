import 'package:care_task/core/helpers/spacing.dart';
import 'package:care_task/core/theming/styles.dart';
import 'package:care_task/features/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductImage(
            context: context,
            image: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg'),
        verticalSpacing(15),
        _buildTitleAndDes(
            title: 'Mens Casual Premium Slim Fit T-Shirts ',
            description:
                'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.'),
        _buildCategory(category: 'men\'s clothing', context: context),
        verticalSpacing(15),
        _buildPrice(price: '\$22.3', context: context),
      ],
    );
  }

  Column _buildCategory(
      {required String category, required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category:',
          style: TextStyles.font16BlackMedium,
        ),
        verticalSpacing(5),
        Text(
          category,
          style: TextStyles.font16WhiteMedium,
        ),
      ],
    );
  }

  Widget _buildTitleAndDes(
      {required String title, required String description}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.font16WhiteMedium,
          ),
          verticalSpacing(10),
          Text(
            'Description:',
            style: TextStyles.font16BlackMedium,
          ),
          verticalSpacing(5),
          Text(
            description,
            style: TextStyles.font16WhiteMedium,
          ),
          verticalSpacing(15),
        ],
      ),
    );
  }

  Center _buildProductImage(
      {required String image, required BuildContext context}) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
            width: ResponsiveLayout.isDesktop(context) ? 70.w : 200,
            fit: BoxFit.cover,
            image),
      ),
    );
  }

  Column _buildPrice({required String price, required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price:',
          style: TextStyles.font16BlackMedium,
        ),
        verticalSpacing(5),
        Text(
          price,
          style: TextStyles.font16WhiteMedium,
        ),
      ],
    );
  }
}
