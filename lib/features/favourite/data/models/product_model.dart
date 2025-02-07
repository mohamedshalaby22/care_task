import 'package:hive_flutter/hive_flutter.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String image;
  @HiveField(1)
  String title;
  @HiveField(2)
  String price;
  @HiveField(3)
  int id;

  ProductModel(
      {required this.image,
      required this.title,
      required this.price,
      required this.id});
  // Convert ProductModel to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'price': price,
      'id': id,
    };
  }

  // Convert JSON Map to ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'],
      title: json['title'],
      price: json['price'],
      id: json['id'],
    );
  }
}
