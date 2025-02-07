import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_list_response.g.dart';

@JsonSerializable()
class ProductListResponse {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;

  ProductListResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
