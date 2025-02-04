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

List<ProductModel> products = [
  ProductModel(
    image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
    price: '\$109.95',
    id: 1,
  ),
  ProductModel(
    image: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    title: 'ohn Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',
    price: '\$50.00',
    id: 2,
  ),
  ProductModel(
    image: 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
    title: 'Solid Gold Petite Micropave ',
    price: '\$90.00',
    id: 3,
  ),
];
