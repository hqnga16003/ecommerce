import 'package:ecommerce_app/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String imgProduct;
  final String nameProduct;
  final String categoryProduct;
  final int numberReviews;
  final int numberRating;
  final String branchProduct;
  final double priceProduct;
  final int discount;

  Product(this.numberReviews, this.branchProduct, this.numberRating,
      this.priceProduct, this.imgProduct, this.nameProduct, this.discount,
      {required this.categoryProduct});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
