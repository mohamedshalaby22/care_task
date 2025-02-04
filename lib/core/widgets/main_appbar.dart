import 'package:care_task/core/routing/routes.dart';
import 'package:care_task/core/theming/styles.dart';
import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            'CARECOMME',
            style: TextStyles.font20WhiteSemiBold,
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.favouriteScreen);
              },
            ),
          ),
        ],
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
