import 'package:care_task/core/helpers/spacing.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'widgets/product_details_appbar.dart';
import 'widgets/product_details_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {super.key, required this.productModel, required this.box});
  final ProductModel productModel;
  final Box box;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailsAppbar(
        productModel: productModel,
        box: box,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(15),
              const ProductDetailsSection(),
              verticalSpacing(15),
            ],
          ),
        ),
      )),
    );
  }
}
