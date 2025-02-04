import 'package:care_task/core/widgets/main_appbar.dart';
import 'package:care_task/features/products/ui/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/spacing.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
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
