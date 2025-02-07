import 'package:care_task/core/helpers/spacing.dart';
import 'package:care_task/features/favourite/ui/widgets/favourite_appbar.dart';
import 'package:care_task/features/favourite/ui/widgets/favourite_list_view.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FavouriteAppbar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpacing(10),
           const  FavouriteListView(),
          ],
        ),
      )),
    );
  }
}
