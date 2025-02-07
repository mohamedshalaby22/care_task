
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;

  ProductDetailsResponse({
     this.id=0,
     this.title='',
     this.price=0.0,
     this.description='',
     this.category='',
     this.image='',
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
}
