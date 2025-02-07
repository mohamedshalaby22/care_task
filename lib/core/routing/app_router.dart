import 'package:care_task/core/di/dependency_injection.dart';
import 'package:care_task/core/routing/routes.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';
import 'package:care_task/features/favourite/ui/screens/favourite_screen.dart';
import 'package:care_task/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:care_task/features/product_details/ui/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetailsScreen:
        final ProductModel productModel = settings.arguments as ProductModel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductDetailsCubit(getIt(), productModel.id)
              ..fetchProductDetails(),
            child: ProductDetailsScreen(
              productModel: productModel,
            ),
          ),
        );
      case Routes.favouriteScreen:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      default:
        return null;
    }
  }
}
