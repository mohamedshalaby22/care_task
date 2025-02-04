import 'package:care_task/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/main_appbar.dart';
import '../products/ui/product_list_view.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({super.key});

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
            const ProductListView(),
          ],
        ),
      )),
    );
  }
}
