import 'package:cached_network_image/cached_network_image.dart';
import 'package:care_task/core/helpers/spacing.dart';
import 'package:care_task/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.isFavourite,
      required this.onPress});
  final String image, title, price;
  final bool isFavourite;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
         border: Border.all(color: Colors.black,),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.contain,
            ),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.font16BlackMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyles.font16BlackMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      onTap: onPress,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_outline,
                          size: 22,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
