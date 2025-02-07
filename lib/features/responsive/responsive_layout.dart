import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/dependency_injection.dart';
import '../products/logic/cubit/products_cubit.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileSacffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  final Widget mobileSacffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  static const int phoneLimit = 500;
  static const int tabletLimit = 800;
  static const int desktopLimit = 1100;
  ///////////////////////

  static bool isPhoneLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopLimit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => ProductsCubit(getIt())..fetchProducts(),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 500) {
          return mobileSacffold;
        }
        if (constraints.maxWidth < 1100) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      }),
    );
  }
}
