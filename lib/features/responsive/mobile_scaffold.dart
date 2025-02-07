import 'package:care_task/core/helpers/spacing.dart';
import 'package:care_task/features/products/ui/products_bloc_builder.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/main_appbar.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            verticalSpacing(25),
            const ProductsBlocBuilder(),
          ],
        ),
      )),
    );
  }
}
