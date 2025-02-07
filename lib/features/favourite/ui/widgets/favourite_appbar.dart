import 'package:care_task/core/theming/styles.dart';
import 'package:flutter/material.dart';

class FavouriteAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const FavouriteAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
        title: Text(
          'Favourite',
          style: TextStyles.font2BlackSemiBold,
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
