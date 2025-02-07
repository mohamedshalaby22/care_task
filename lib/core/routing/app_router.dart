import 'package:care_task/core/routing/routes.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';
import 'package:care_task/features/favourite/ui/screens/favourite_screen.dart';
import 'package:care_task/features/product_details/ui/product_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouter { 

  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetailsScreen:
        final ProductModel productModel = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            productModel: productModel,
          // Pass the box
          ),
        );
      case Routes.favouriteScreen:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      default:
        return null;
    }
  }
}
